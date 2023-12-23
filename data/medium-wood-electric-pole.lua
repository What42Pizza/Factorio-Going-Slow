local entity = table.deepcopy(data.raw["electric-pole"]["small-electric-pole"])
entity.minable.result = "medium-wood-electric-pole"
entity.maximum_wire_distance = 9
entity.supply_area_distance = 3.5
entity.corpse = "medium-wood-electric-pole-remnants"
replaceAllGraphicsFileNames(entity, "small-electric-pole", "medium-wood-electric-pole")
entity.icon = replaceGraphicsFileName(entity.icon, "small-electric-pole", "medium-wood-electric-pole")
entity.order = incrementOrder(entity.order)
entity.name = "medium-wood-electric-pole"



local corpse = table.deepcopy(data.raw.corpse["small-electric-pole-remnants"])
replaceAllGraphicsFileNames(corpse, "small-electric-pole", "medium-wood-electric-pole")
corpse.icon = replaceGraphicsFileName(corpse.icon, "small-electric-pole", "medium-wood-electric-pole")
corpse.name = "medium-wood-electric-pole-remnants"



local item = table.deepcopy(data.raw.item["small-electric-pole"])
item.name = "medium-wood-electric-pole"
item.place_result = "medium-wood-electric-pole"
item.icon = replaceGraphicsFileName(item.icon, "small-electric-pole", "medium-wood-electric-pole")
item.order = incrementOrder(item.order)



local recipe = table.deepcopy(data.raw["recipe"]["medium-electric-pole"])
recipe.ingredients = {
	{type = "item", name = "small-electric-pole", amount = 1},
	{type = "item", name = "iron-stick", amount = 2},
	{type = "item", name = "copper-plate", amount = 1}
}
recipe.result = "medium-wood-electric-pole"
recipe.enabled = false
recipe.name = "medium-wood-electric-pole"



local technology = {
	type = "technology",
	name = "medium-wood-electric-pole",
	icon = "__going-slow__/graphics/icons/medium-wood-electric-pole.png",
	icon_size = 64,
	icon_mipmaps = 4,
	prerequisites = {
		"logistics-2",
		"stack-inserter",
		"railway"
	},
	unit = {
		count = 150,
		ingredients = {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"chemical-science-pack", 1},
			{"production-science-pack", 1}
		},
		time = 30
	},
	effects = {
		{
			type = "unlock-recipe",
			recipe = "medium-wood-electric-pole"
		}
	},
	order = "a-k-a"
}



data:extend{
	entity,
	corpse,
	item,
	recipe,
	technology
}
