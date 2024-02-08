function addSpidertronLevel(name, prev_name, grid_height, cost, require_space_pack_tech)
	
	local entity = table.deepcopy(data.raw["spider-vehicle"]["spidertron"])
	entity.name = name
	entity.minable.result = name
	entity.equipment_grid = name .. "-equipment-grid"
	--entity.order = incrementOrder(entity.order)
	
	local equipment_grid = table.deepcopy(data.raw["equipment-grid"]["spidertron-equipment-grid"])
	equipment_grid.name = name .. "-equipment-grid"
	equipment_grid.height = grid_height
	--equipment_grid.order = incrementOrder(equipment_grid.order)
	
	local item = table.deepcopy(data.raw["item-with-entity-data"]["spidertron"])
	item.name = name
	--item.order = incrementOrder(item.order)
	item.place_result = name
	
	local recipe = table.deepcopy(data.raw["recipe"]["spidertron"])
	recipe.name = name
	recipe.ingredients = {
		{type = "item", name = "raw-fish", amount = 1},
		{type = "item", name = prev_name, amount = 1},
		{type = "item", name = "rocket-control-unit", amount = 16},
		{type = "item", name = "low-density-structure", amount = 100},
		{type = "item", name = "effectivity-module-2", amount = 5},
		{type = "item", name = "fusion-reactor-equipment", amount = 2}
	}
	recipe.result = name
	recipe.enabled = false
	
	local technology = table.deepcopy(data.raw["technology"]["spidertron"])
	technology.name = name
	technology.prerequisites = {
		prev_name
	}
	if require_space_pack_tech then
		table.insert(technology.prerequisites, "space-science-pack")
	end
	technology.unit = {
		count = cost,
		ingredients = {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"military-science-pack", 1},
			{"chemical-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1}
		},
		time = 30
	}
	technology.effects = {
		{
			type = "unlock-recipe",
			recipe = "spidertron-mk2"
		}
	}
	
	data:extend{
		entity,
		equipment_grid,
		item,
		recipe,
		technology
	}
	
end



addSpidertronLevel("spidertron-mk2", "spidertron", 8, 5000, true)
addSpidertronLevel("spidertron-mk3", "spidertron-mk2", 10, 10000, false)
addSpidertronLevel("spidertron-mk4", "spidertron-mk3", 12, 20000, false)
addSpidertronLevel("spidertron-mk5", "spidertron-mk4", 14, 40000, false)
