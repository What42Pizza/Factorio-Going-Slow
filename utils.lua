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
			table.remove(tableIn, i)
		else
			tableIn[k] = nil
		end
	end
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

function removeTechnologyPrerequisite(techName, prereqName)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("technology \"" .. techName .. "\" does not exist")
		return
	end
	removeItemsFromTable(tech.prerequisites, function(prereq)
		return prereq == prereqName
	end)
end

function addTechnologyPrerequisite(techName, prereqName)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("technology \"" .. techName .. "\" does not exist")
		return
	end
	addItem(tech.prerequisites, prereqName)
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
		warn("technology \"" .. techName .. " does not exist.")
		return
	end
	if type(cost) == "string" then
		tech.unit.count_formula = cost
	else
		tech.unit.count = cost
	end
end

function multiplyTechnologyCost(techName, amount)
	local tech = data.raw.technology[techName]
	if not tech then
		warn("technology \"" .. techName .. " does not exist.")
		return
	end
	local unit = tech.unit
	if type(unit.count) ~= "nil" then
		unit.count = unit.count * amount
	end
	if type(unit.count_formula) ~= "nil" then
		unit.count_formula = unit.count_formula .. '*' .. tostring(amount)
	end
end



function setRecipeEnabled(recipeName, newValue)
	local recipe = data.raw.recipe[recipeName]
	if not recipe then
		warn("recipe \"" .. recipeName .. " does not exist.")
		return
	end
	recipe.enabled = newValue
	recipe.hidden = not newValue
	recipe.hide_from_stats = not newValue
	recipe.hide_from_player_crafting = not newValue
	if recipe.normal then
		recipe.normal.enabled = newValue
		recipe.normal.hidden = not newValue
		recipe.normal.hide_from_stats = not newValue
		recipe.normal.hide_from_player_crafting = not newValue
	end
	if recipe.expensive then
		recipe.expensive.enabled = newValue
		recipe.expensive.hidden = not newValue
		recipe.expensive.hide_from_stats = not newValue
		recipe.expensive.hide_from_player_crafting = not newValue
	end
end

function addItemToRecipe(recipeName, itemName, itemAmount)
	local recipe = data.raw.recipe[recipeName]
	if not recipe then
		warn("recipe \"" .. recipeName .. " does not exist.")
		return
	end
	for _,item in ipairs(recipe.ingredients) do
		if item[1] == itemName then
			item[2] = math.max(item[2], itemAmount)
			return
		end
	end
	addItem(recipe.ingredients, {itemName, itemAmount})
end
