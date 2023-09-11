-- math aliases

sqrt = math.sqrt
min = math.min
max = math.max
floor = math.floor
ceil = math.ceil
function round(input)
	return floor(input + 0.5)
end



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
	local message = format("WARNING:", ...)
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

function addItemIfNotPresent(tableIn, item, testFn)
	testFn = testFn or function(other)
		return item == other
	end
	for _,other in pairs(tableIn) do
		if testFn(other) then return end
	end
	addItem(tableIn, item)
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

function copyTechTablePrereqs(fromTech, toTech)
	for _,prereq in ipairs(fromTech.prerequisites) do
		addItemIfNotPresent(toTech.prerequisites, prereq)
	end
end

function removeTechnologyFromPrereqs(techName)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("tech \"" .. techName .. "\" does not exist")
		return
	end
	for _,currTech in pairs(data.raw.technology) do
		if not tech.prerequisites then goto continue end
		currTech.prerequisites = currTech.prerequisites or {}
		local lengthBeforeRemoved = #currTech.prerequisites or {}
		removeItemsFromTable(currTech.prerequisites, function(pre)
			return pre == techName
		end)
		if tech.prerequisites and #currTech.prerequisites ~= lengthBeforeRemoved then
			copyTechTablePrereqs(tech, currTech)
		end
		::continue::
	end
end

function updateTechnology(techName, updates)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("tech \"" .. techName .. "\" does not exist")
		return
	end
	local i = 1
	while i <= #updates do
		local updateType = updates[i]
		local argCount = 0
		switch(updateType, {
			
			["disable"] = function()
				--log("tech \"" .. techName .. "\": disabling")
				tech.hidden = true
				removeTechnologyFromPrereqs(tech.name)
			end,
			
			["add prereq"] = function()
				argCount = 1
				local prereqName = updates[i+1]
				--log("tech \"" .. techName .. "\": adding prereq \"" .. prereqName .. "\"")
				tech.prerequisites = tech.prerequisites or {}
				if tableContainsItem(tech.prerequisites, prereqName) then
					warn("attempted to add prerequisite \"" .. prereqName .. "\" to technology \"" .. techName .. "\", but it is already present")
					return
				end
				addItem(tech.prerequisites, prereqName)
			end,
			
			["remove prereq"] = function()
				argCount = 1
				local prereqName = updates[i+1]
				--log("tech \"" .. techName .. "\": removing prereq \"" .. prereqName .. "\"")
				if not tech.prerequisites then return end
				removeItemsFromTable(tech.prerequisites, function(prereq)
					return prereq == prereqName
				end)
			end,
			
			["add recipe"] = function()
				argCount = 1
				local recipeName = updates[i+1]
				--log("tech \"" .. techName .. "\": adding recipe \"" .. recipeName .. "\"")
				for _,effect in ipairs(tech.effects) do
					if effect.recipe == recipeName then return end
				end
				addItem(tech.effects, {
					type = "unlock-recipe",
					recipe = recipeName
				})
			end,
			
			["remove recipe"] = function()
				argCount = 1
				local recipeName = updates[i+1]
				--log("tech \"" .. techName .. "\": removing recipe \"" .. recipeName .. "\"")
				removeItemsFromTable(tech.effects, function(effect)
					return effect.recipe == recipeName
				end)
			end,
			
			["add science"] = function()
				argCount = 2
				local scienceName = updates[i+1]
				local scienceCount = updates[i+2]
				--log("tech \"" .. techName .. "\": adding science \"" .. scienceName .. "\", count: " .. tostring(scienceCount))
				function addScienceToList(list)
					for _,ingredient in ipairs(list) do
						if ingredient.name == scienceName then
							ingredient.amount = max(ingredient.amount, scienceCount)
							return
						end
						if ingredient[1] == scienceName then
							ingredient[2] = max(ingredient[2], scienceCount)
							return
						end
					end
					addItem(list, {type = "item", name = scienceName, amount = scienceCount})
				end
				if tech.unit then addScienceToList(tech.unit.ingredients) end
				if tech.normal then addScienceToList(tech.normal.unit.ingredients) end
				if tech.expensive then addScienceToList(tech.expensive.unit.ingredients) end
			end,
			
			["remove science"] = function()
				argCount = 1
				local scienceName = updates[i+1]
				--log("tech \"" .. techName .. "\": removing science \"" .. scienceName .. "\"")
				function testFn(ingredient)
					return ingredient.name == scienceName or ingredient[1] == scienceName
				end
				if tech.unit then removeItemsFromTable(tech.unit.ingredients, testFn) end
				if tech.normal then removeItemsFromTable(tech.normal.unit.ingredients, testFn) end
				if tech.expensive then removeItemsFromTable(tech.expensive.unit.ingredients, testFn) end
			end,
			
			["set cost"] = function()
				argCount = 1
				local cost = updates[i+1]
				--log("tech \"" .. techName .. "\": setting cost to " .. tostring(cost))
				function setCost(unit)
					if type(cost) == "string" then
						unit.count = nil
						unit.count_formula = cost
					else
						unit.count = cost
						unit.count_formula = nil
					end
				end
				if tech.unit then setCost(tech.unit) end
				if tech.normal then setCost(tech.normal.unit) end
				if tech.expensive then setCost(tech.expensive.unit) end
			end,
			
		}, function()
			warn("unknown command for updateTechnology(): \"" .. tostring(updateType) .. "\"")
			log("Technology: \"" .. techName .. "\"")
			log(format("Updates:", updates))
			log("index: " .. tostring(i))
		end)
		i = i + 1 + argCount
	end
end



-- recipes

function addItemToRecipeTable(recipe, itemName, count)
	function addItemToIngredients(ingredients)
		for _,item in ipairs(ingredients) do
			if item[1] == itemName then
				item[2] = max(item[2], count)
				return
			end
			if item.name == itemName then
				item.amount = max(item.amount, count)
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
		local updateType = updates[i]
		local argCount = 0
		switch(updateType, {
			
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
				recipe.enabled = false
				if recipe.normal then recipe.normal.enabled = false end
				if recipe.expensive then recipe.expensive.enabled = false end
			end,
			
		}, function()
			warn("unknown command for updateRecipe(): \"" .. tostring(updateType) .. "\"")
			log("Recipe: \"" .. recipeName .. "\"")
			log(format("Updates:", updates))
			log("index: " .. tostring(i))
		end)
		i = i + 1 + argCount
	end
end



-- units

function updateUnit(unitName, updates)
	local unit = data.raw.unit[unitName]
	if not unit then
		warn("unit \"" .. unitName .. "\" does not exist")
		return
	end
	local i = 1
	while i <= #updates do
		local updateType = updates[i]
		local argCount = 0
		switch(updateType, {
			
			["set health"] = function()
				argCount = 1
				local health = updates[i+1]
				unit.max_health = health
			end,
			
			["set flat resistance"] = function()
				argCount = 2
				local resistanceType = updates[i+1]
				local resistanceAmount = updates[i+2]
				unit.resistances = unit.resistances or {}
				for _,resistance in ipairs(unit.resistances) do
					if resistance.type == resistanceType then
						resistance.decrease = resistanceAmount
						return
					end
				end
				addItem(unit.resistances, {type = resistanceType, decrease = resistanceAmount})
			end,
			
			["set resistance percent"] = function()
				argCount = 2
				local resistanceType = updates[i+1]
				local resistanceAmount = updates[i+2]
				unit.resistances = unit.resistances or {}
				for _,resistance in ipairs(unit.resistances) do
					if resistance.type == resistanceType then
						resistance.percent = resistanceAmount
						return
					end
				end
				addItem(unit.resistances, {type = resistanceType, percent = resistanceAmount})
			end,
			
			["set resistance"] = function()
				argCount = 3
				local resistanceType = updates[i+1]
				local flatResistance = updates[i+2]
				local percentResistance = updates[i+3]
				unit.resistances = unit.resistances or {}
				for _,resistance in ipairs(unit.resistances) do
					if resistance.type == resistanceType then
						resistance.decrease = flatResistance
						resistance.percent = percentResistance
						return
					end
				end
				addItem(unit.resistances, {type = resistanceType, decrease = flatResistance, percent = percentResistance})
			end,
			
		}, function()
			warn("unknown command for updateUnit(): \"" .. tostring(updateType) .. "\"")
			log("Unit: \"" .. unitName .. "\"")
			log(format("Updates:", updates))
			log("index: " .. tostring(i))
		end)
		i = i + 1 + argCount
	end
end
