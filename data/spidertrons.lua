function addSpidertronLevel(level)
	local name = "spidertron-mk" .. level
	local prev_name = "spidertron-mk" .. (level - 1)
	if level == 2 then prev_name = "spidertron" end
	local grid_height = level * 2 + 4
	local recipe_cost_mult = math.pow(2, level - 1)
	local research_cost = math.pow(2, level - 2) * 5000
	
	
	-- entity
	local entity = table.deepcopy(data.raw["spider-vehicle"]["spidertron"])
	entity.name = name
	entity.minable.result = name
	entity.equipment_grid = name .. "-equipment-grid"
	
	
	-- guns
	local gun1 = table.deepcopy(data.raw.gun["spidertron-rocket-launcher-1"])
	local gun2 = table.deepcopy(data.raw.gun["spidertron-rocket-launcher-2"])
	local gun3 = table.deepcopy(data.raw.gun["spidertron-rocket-launcher-3"])
	local gun4 = table.deepcopy(data.raw.gun["spidertron-rocket-launcher-4"])
	gun1.name = setNameNumber(gun1.name, level * 4 - 3)
	gun2.name = setNameNumber(gun2.name, level * 4 - 2)
	gun3.name = setNameNumber(gun3.name, level * 4 - 1)
	gun4.name = setNameNumber(gun4.name, level * 4 - 0)
	gun1.attack_parameters.range = gun1.attack_parameters.range * (0.5 + level * 0.5)
	gun2.attack_parameters.range = gun2.attack_parameters.range * (0.5 + level * 0.5)
	gun3.attack_parameters.range = gun3.attack_parameters.range * (0.5 + level * 0.5)
	gun4.attack_parameters.range = gun4.attack_parameters.range * (0.5 + level * 0.5)
	
	entity.guns = {
		gun1.name,
		gun2.name,
		gun3.name,
		gun4.name
	}
	
	
	-- equipment grid
	local equipment_grid = table.deepcopy(data.raw["equipment-grid"]["spidertron-equipment-grid"])
	equipment_grid.name = name .. "-equipment-grid"
	equipment_grid.height = grid_height
	
	
	-- item
	local item = table.deepcopy(data.raw["item-with-entity-data"]["spidertron"])
	item.name = name
	item.place_result = name
	
	
	-- recipes
	local new_recipe = table.deepcopy(data.raw["recipe"]["spidertron"])
	new_recipe.name = "new-" .. name
	for _,v in ipairs(new_recipe.ingredients) do
		if v.amount then
			v.amount = v.amount * recipe_cost_mult
		else
			v[2] = v[2] * recipe_cost_mult
		end
	end
	new_recipe.result = name
	new_recipe.enabled = false
	
	local recycle_recipe = table.deepcopy(data.raw["recipe"]["spidertron"])
	recycle_recipe.name = "recycle-" .. name
	for _,v in ipairs(recycle_recipe.ingredients) do
		if v.amount then
			v.amount = v.amount * recipe_cost_mult / 2
		else
			v[2] = v[2] * recipe_cost_mult / 2
		end
	end
	table.insert(recycle_recipe.ingredients, 1, {prev_name, 1})
	recycle_recipe.result = name
	recycle_recipe.enabled = false
	
	
	-- technology
	local technology = table.deepcopy(data.raw.technology["spidertron"])
	technology.name = name
	technology.prerequisites = {
		prev_name
	}
	if level == 2 then
		table.insert(technology.prerequisites, "space-science-pack")
	end
	technology.unit = {
		count = research_cost,
		ingredients = {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"military-science-pack", 1},
			{"chemical-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1}
		},
		time = 60
	}
	technology.effects = {
		{
			type = "unlock-recipe",
			recipe = "new-spidertron-mk2"
		},
		{
			type = "unlock-recipe",
			recipe = "recycle-spidertron-mk2"
		}
	}
	
	
	-- finish
	data:extend{
		entity,
		gun1,
		gun2,
		gun3,
		gun4,
		equipment_grid,
		item,
		new_recipe,
		recycle_recipe,
		technology
	}
end



updateRecipe("spidertron", {
	"remove item", "effectivity-module-3",
	"add item", "effectivity-module-2", 5
})

addSpidertronLevel(2)
addSpidertronLevel(3)
addSpidertronLevel(4)
addSpidertronLevel(5)
--addSpidertronLevel("spidertron-mk2", "spidertron", 2, 8, 5000, true)
--addSpidertronLevel("spidertron-mk3", "spidertron-mk2", 4, 10, 10000, false)
--addSpidertronLevel("spidertron-mk4", "spidertron-mk3", 8, 12, 20000, false)
--addSpidertronLevel("spidertron-mk5", "spidertron-mk4", 16, 14, 40000, false)




--local technology = table.deepcopy(data.raw.technology["spidertron"])
--technology.name = "fix tech"
--technology.prerequisites = {
	
--}
--technology.unit = {
--	count = 1,
--	ingredients = {
--		{"automation-science-pack", 1}
--	},
--	time = 1
--}
--technology.effects = {
--	{
--		type = "unlock-recipe",
--		recipe = "new-spidertron-mk2"
--	},
--	{
--		type = "unlock-recipe",
--		recipe = "recycle-spidertron-mk2"
--	}
--}

--data:extend{
--	technology
--}
