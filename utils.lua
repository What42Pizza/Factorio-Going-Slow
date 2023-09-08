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

function switch(input, cases)
	local usedCase = cases[input]
	if type(usedCase) == "function" then
		return usedCase()
	else
		return usedCase
	end
end



function warn(...)
	local message = format("WARNING: ", ...)
	local padding = string.rep("=", string.len(message))
	log(padding)
	log(message)
	log(padding)
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



function incrementOrder(order)
	if not order then return "a" end
	local lastCharNum = string.byte(order, #order, #order)
	local newCharNum = string.char(lastCharNum + 1)
	return string.sub(order, 1, -2) .. newCharNum
end



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
		switch(type, {
			["add"] = function()
				local prereqName = updates[i+1]
				i = i + 2
				if tableContainsItem(prereqs, prereqName) then
					warn("attempted to add prerequisite \"" .. prereqName .. "\" to technology \"" .. techName .. "\", but it is already present")
					return
				end
				addItem(prereqs, prereqName)
			end,
			["remove"] = function()
				local prereqName = updates[i+1]
				i = i + 2
				removeItemsFromTable(prereqs, function(prereqName)
					return prereqName == prereqName
				end)
			end,
		})
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



function disableRecipeAtStart(recipeName)
	local recipe = data.raw.recipe[recipeName]
	if not recipe then
		warn("recipe \"" .. recipeName .. "\" does not exist.")
		return
	end
	recipe.enabled = false
	if recipe.normal then
		recipe.normal.enabled = false
	end
	if recipe.expensive then
		recipe.expensive.enabled = false
	end
end

function addItemToRecipe(recipeName, itemName, itemAmount)
	function addItemToIngredients(ingredients)
		for _,item in ipairs(ingredients) do
			if item[1] == itemName then
				item[2] = math.max(item[2], itemAmount)
				return
			end
		end
		addItem(ingredients, {itemName, itemAmount})
	end
	local recipe = data.raw.recipe[recipeName]
	if not recipe then
		warn("recipe \"" .. recipeName .. "\" does not exist.")
		return
	end
	if recipe.ingredients then
		addItemToIngredients(recipe.ingredients)
	end
	if recipe.normal then
		addItemToIngredients(recipe.normal.ingredients)
	end
	if recipe.expensive then
		addItemToIngredients(recipe.expensive.ingredients)
	end
end

function removeItemFromRecipe(recipeName, itemName)
	local recipe = data.raw.recipe[recipeName]
	if not recipe then
		warn("recipe \"" .. recipeName .. "\" does not exist.")
		return
	end
	if recipe.ingredients then
		removeItemsFromTable(recipe.ingredients, function(item)
			return item[1] == itemName
		end)
	end
	if recipe.normal then
		removeItemsFromTable(recipe.normal.ingredients, function(item)
			return item[1] == itemName
		end)
	end
	if recipe.expensive then
		removeItemsFromTable(recipe.expensive.ingredients, function(item)
			return item[1] == itemName
		end)
	end
end
