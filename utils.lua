-- logging

function betterToString(value, tabLevel)
	if type(tabLevel) == "nil" then tabLevel = 1 end
	if type(value) ~= "table" then
		return tostring(value)
	end
	local output = "{"
	local tabString = ""
	for i=1,tabLevel do
		tabString = tabString .. '    '
	end
	for k,v in pairs(value) do
		output = output .. '\n' .. tabString .. betterToString(k, tabLevel + 1) .. ": " .. betterToString(v, tabLevel + 1)
	end
	tabString = string.sub(tabString, 5)
	output = output .. '\n' .. tabString .. '}'
	return output
end

function format(...)
	local inputs = table.pack(...)
	for i=1,#inputs do
		inputs[i] = betterToString(inputs[i])
	end
	return table.concat(inputs, " ")
end

function warn(...)
	local message = format("WARNING: ", ...)
	local padding = string.rep("=", string.len(message))
	log(padding)
	log(message)
	log(padding)
end



-- basic stuff

function switch(input, cases, default)
	local usedCase = cases[input]
	if type(usedCase) == "nil" and default then
		usedCase = default
	end
	if type(usedCase) == "function" then
		return usedCase()
	else
		return usedCase
	end
end

function addItem(tableIn, item)
	tableIn[#tableIn+1] = item
end

function removeItemsFromTable(tableIn, testFn)
	local keysToRemove = {}
	for k,v in pairs(tableIn) do
		if testFn(v) then
			addItem(keysToRemove, k)
		end
	end
	for i=#keysToRemove,1,-1 do
		local k = keysToRemove[i]
		if type(k) == "number" then
			table.remove(tableIn, k)
		else
			tableIn[k] = nil
		end
	end
end

function tableContainsItem(tableIn, item)
	for _,v in pairs(tableIn) do
		if v == item then return true end
	end
	return false
end



-- misc

function incrementOrder(order)
	if not order then return "a" end
	local lastCharNum = string.byte(order, #order, #order)
	local newCharNum = string.char(lastCharNum + 1)
	return string.sub(order, 1, -2) .. newCharNum
end



-- technologies

function removeTechnology(techName)
	if not data.raw.technology[techName] then
		warn("technology \"" .. techName .. "\" does not exist")
		return
	end
	data.raw.technology[techName].hidden = true
	for _,tech in pairs(data.raw.technology) do
		if not tech.prerequisites then goto continue end
		removeItemsFromTable(tech.prerequisites, function(pre)
			return pre == techName
		end)
		::continue::
	end
end

function updateTechnologyPrerequisites(techName, updates)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("technology \"" .. techName .. "\" does not exist")
		return
	end
	tech.prerequisites = tech.prerequisites or {}
	local prereqs = tech.prerequisites
	local i = 1
	while i <= #updates do
		local type = updates[i]
		local argCount = 0
		switch(type, {
			["add"] = function()
				argCount = 1
				local prereqName = updates[i+1]
				if tableContainsItem(prereqs, prereqName) then
					warn("attempted to add prerequisite \"" .. prereqName .. "\" to technology \"" .. techName .. "\", but it is already present")
					return
				end
				addItem(prereqs, prereqName)
			end,
			["remove"] = function()
				argCount = 1
				local prereqName = updates[i+1]
				removeItemsFromTable(prereqs, function(prereq)
					return prereq == prereqName
				end)
			end,
		})
		i = i + 1 + argCount
	end
end

function removeRecipeFromTechnologies(recipeName)
	for _,tech in pairs(data.raw.technology) do
		if not tech.effects then goto continue end
		removeItemsFromTable(tech.effects, function(effect)
			return effect.recipe == recipeName
		end)
		::continue::
	end
end

function addRecipeToTechnology(techName, recipeName)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("technology \"" .. techName .. "\" does not exist")
		return
	end
	addItem(tech.effects, {
		type = "unlock-recipe",
		recipe = recipeName
	})
end

function addScienceToTechnology(techName, scienceName, scienceAmount)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("technology \"" .. techName .. "\" does not exist.")
		return
	end
	local unit = tech.unit
	for _,ingredient in ipairs(unit.ingredients) do
		if ingredient[1] == scienceName then
			ingredient[2] = math.max(ingredient[2], scienceAmount)
			return
		end
	end
	addItem(unit.ingredients, {scienceName, scienceAmount})
end

function removeScienceFromTechnology(techName, scienceName)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("technology \"" .. techName .. "\" does not exist.")
		return
	end
	local unit = tech.unit
	removeItemsFromTable(unit.ingredients, function(ingredient)
		return ingredient[1] == scienceName
	end)
end

function setTechnologyCost(techName, cost)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("technology \"" .. techName .. "\" does not exist.")
		return
	end
	if type(cost) == "string" then
		tech.unit.count_formula = cost
	else
		tech.unit.count = cost
	end
end

function multiplyTechnologyCost(techName, amount, multiplyInfinite)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("technology \"" .. techName .. "\" does not exist.")
		return
	end
	local unit = tech.unit
	if type(unit.count) ~= "nil" then
		unit.count = unit.count * amount
	end
	if type(unit.count_formula) ~= "nil" and multiplyInfinite then
		unit.count_formula = unit.count_formula .. '*' .. tostring(amount)
	end
end



-- recipes

function addItemToRecipeTable(recipe, itemName, count)
	function addItemToIngredients(ingredients)
		for _,item in ipairs(ingredients) do
			if item[1] == itemName then
				item[2] = math.max(item[2], count)
				return
			end
			if item.name == itemName then
				item.amount = math.max(item.amount, count)
				return
			end
		end
		addItem(ingredients, {type = "item", name = itemName, amount = count})
	end
	if recipe.ingredients then addItemToIngredients(recipe.ingredients) end
	if recipe.normal then addItemToIngredients(recipe.normal.ingredients) end
	if recipe.expensive then addItemToIngredients(recipe.expensive.ingredients) end
end

function removeItemFromRecipeTable(recipe, itemName, count)
	function testFn(item)
		return item.name == itemName or item[1] == itemName
	end
	if recipe.ingredients then removeItemsFromTable(recipe.ingredients, testFn) end
	if recipe.normal then removeItemsFromTable(recipe.normal.ingredients, testFn) end
	if recipe.expensive then removeItemsFromTable(recipe.expensive.ingredients, testFn) end
end

function setItemInRecipeTable(recipe, itemName, count)
	function setItemInIngredients(ingredients)
		for _,item in ipairs(ingredients) do
			if item[1] == itemName then
				item[2] = count
				return
			end
			if item.name == itemName then
				item.amount = count
				return
			end
		end
		addItem(ingredients, {type = "item", name = itemName, amount = count})
	end
	if recipe.ingredients then setItemInIngredients(recipe.ingredients) end
	if recipe.normal then setItemInIngredients(recipe.normal.ingredients) end
	if recipe.expensive then setItemInIngredients(recipe.expensive.ingredients) end
end

function updateRecipe(recipeName, updates)
	local recipe = data.raw.recipe[recipeName]
	if not recipe then
		warn("recipe \"" .. recipeName .. "\" does not exist")
		return
	end
	local i = 1
	while i <= #updates do
		local type = updates[i]
		local argCount = 0
		switch(type, {
			
			-- sets the result count
			["set count"] = function()
				argCount = 1
				local count = updates[i+1]
				if recipe.result_count then recipe.result_count = count end
				if recipe.normal then recipe.normal.result_count = count end
				if recipe.expensive then recipe.expensive.result_count = count end
			end,
			
			["craft time"] = function()
				argCount = 1
				local craftTime = updates[i+1]
				if recipe.energy_required then recipe.energy_required = craftTime end
				if recipe.normal then recipe.normal.energy_required = craftTime end
				if recipe.expensive then recipe.expensive.energy_required = craftTime end
			end,
			
			-- like 'set item', but if it's already present, the recipe count is set to at least this count (doesn't lower count if item is already present, unlike 'set item')
			["add item"] = function()
				argCount = 2
				local itemName = updates[i+1]
				local count = updates[i+2]
				addItemToRecipeTable(recipe, itemName, count)
			end,
			
			-- removes an item from ingredients (or does nothing if already removed)
			["remove item"] = function()
				argCount = 1
				local itemName = updates[i+1]
				removeItemFromRecipeTable(recipe, itemName)
			end,
			
			-- sets the count of an item or adds it if not already present
			["set item"] = function()
				argCount = 2
				local itemName = updates[i+1]
				local count = updates[i+2]
				setItemInRecipeTable(recipe, itemName, count)
			end,
			
			-- disables the recipe so that it needs to be unlocked with research
			["disable at start"] = function()
				argCount = 0
				recipe.enabled = false
				if recipe.normal then recipe.normal.enabled = false end
				if recipe.expensive then recipe.expensive.enabled = false end
			end,
			
		}, function()
			warn("unknown command for updateRecipe(): \"" .. tostring(type) .. "\"")
		end)
		i = i + 1 + argCount
	end
end
