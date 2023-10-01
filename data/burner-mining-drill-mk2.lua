local entity = table.deepcopy(data.raw["mining-drill"]["burner-mining-drill"])
entity.minable.result = "burner-mining-drill-mk2"
entity.mining_speed = entity.mining_speed * 1.5
entity.resource_searching_radius = 1.99
entity.order = incrementOrder(entity.order)
entity.name = "burner-mining-drill-mk2"



local item = {
	type = "item",
	icon = "__base__/graphics/icons/burner-mining-drill.png",
	icon_mipmaps = 4,
	icon_size = 64,
	name = "burner-mining-drill-mk2",
	order = "a[items]-a[burner-mining-drill]",
	place_result = "burner-mining-drill-mk2",
	stack_size = 50,
	subgroup = "extraction-machine"
}



local recipe = table.deepcopy(data.raw["recipe"]["burner-mining-drill"])
recipe.ingredients = {
	{type = "item", name = "burner-mining-drill", amount = 1},
	{type = "item", name = "steel-plate", amount = 5},
	{type = "item", name = "engine-unit", amount = 1}
}
recipe.normal.ingredients = {
	{type = "item", name = "burner-mining-drill", amount = 1},
	{type = "item", name = "steel-plate", amount = 5},
	{type = "item", name = "engine-unit", amount = 1}
}
recipe.expensive.ingredients = {
	{type = "item", name = "burner-mining-drill", amount = 2},
	{type = "item", name = "steel-plate", amount = 10},
	{type = "item", name = "engine-unit", amount = 2}
}
recipe.result = "burner-mining-drill-mk2"
recipe.normal.result = "burner-mining-drill-mk2"
recipe.expensive.result = "burner-mining-drill-mk2"
recipe.enabled = false
recipe.name = "burner-mining-drill-mk2"



local technology = {
	type = "technology",
	name = "burner-mining-drill-mk2",
	icon = "__base__/graphics/icons/burner-mining-drill.png",
	icon_size = 64,
	icon_mipmaps = 4,
	prerequisites = {
		"inserter",
		"steel-processing"
	},
	unit = {
		count = 75,
		ingredients = {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1}
		},
		time = 30
	},
	effects = {
		{
			type = "unlock-recipe",
			recipe = "burner-mining-drill-mk2"
		}
	},
	order = "a-k-a"
}



data:extend{
	entity,
	item,
	recipe,
	technology
}
