require("utils")





-- entities

local burner_mining_drill_mk2 = table.deepcopy(data.raw["mining-drill"]["burner-mining-drill"])
burner_mining_drill_mk2.minable.result = "burner-mining-drill-mk2"
burner_mining_drill_mk2.mining_speed = burner_mining_drill_mk2.mining_speed * 1.5
burner_mining_drill_mk2.resource_searching_radius = 1.99
burner_mining_drill_mk2.order = incrementOrder(burner_mining_drill_mk2.order)
burner_mining_drill_mk2.name = "burner-mining-drill-mk2"

data:extend{
	burner_mining_drill_mk2
}





-- items

data:extend{
	{
		icon = "__base__/graphics/icons/burner-mining-drill.png",
		icon_mipmaps = 4,
		icon_size = 64,
		name = "burner-mining-drill-mk2",
		order = "a[items]-a[burner-mining-drill]",
		place_result = "burner-mining-drill-mk2",
		stack_size = 50,
		subgroup = "extraction-machine",
		type = "item"
	},
}





-- recipes

local burner_mining_drill_mk2_recipe = table.deepcopy(data.raw["recipe"]["burner-mining-drill"])
burner_mining_drill_mk2_recipe.ingredients = {
	{type = "item", name = "burner-mining-drill", amount = 1},
	{type = "item", name = "steel-plate", amount = 5},
	{type = "item", name = "engine-unit", amount = 1}
}
if burner_mining_drill_mk2_recipe.normal then
	burner_mining_drill_mk2_recipe.normal.ingredients = {
		{type = "item", name = "burner-mining-drill", amount = 1},
		{type = "item", name = "steel-plate", amount = 5},
		{type = "item", name = "engine-unit", amount = 1}
	}
end
if burner_mining_drill_mk2_recipe.expensive then
	burner_mining_drill_mk2_recipe.expensive.ingredients = {
		{type = "item", name = "burner-mining-drill", amount = 2},
		{type = "item", name = "steel-plate", amount = 10},
		{type = "item", name = "engine-unit", amount = 2}
	}
end
if burner_mining_drill_mk2_recipe.result then
	burner_mining_drill_mk2_recipe.result = "burner-mining-drill-mk2"
end
if burner_mining_drill_mk2_recipe.normal then
	burner_mining_drill_mk2_recipe.normal.result = "burner-mining-drill-mk2"
end
if burner_mining_drill_mk2_recipe.expensive then
	burner_mining_drill_mk2_recipe.expensive.result = "burner-mining-drill-mk2"
end
burner_mining_drill_mk2_recipe.enabled = false
burner_mining_drill_mk2_recipe.name = "burner-mining-drill-mk2"

data:extend{
	burner_mining_drill_mk2_recipe
}





-- researches

data:extend{
	
	
	
	-- power pole & steam engine research
	{
		type = "technology",
		name = "electric-power",
		icon = "__base__/graphics/icons/steam-engine.png",
		icon_size = 64,
		icon_mipmaps = 4,
		prerequisites = {
			"automation"
		},
		unit = {
			count = 50,
			ingredients = {
				{"automation-science-pack", 1}
			},
			time = 10
		},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "steam-engine"
			},
			{
				type = "unlock-recipe",
				recipe = "small-electric-pole"
			}
		},
		order = "a-k-a"
	},
	
	
	
	-- inserter reasearch
	{
		type = "technology",
		name = "inserter",
		icon = "__base__/graphics/icons/inserter.png",
		icon_size = 64,
		icon_mipmaps = 4,
		prerequisites = {
			"electric-power",
			"logistics"
		},
		unit = {
			count = 50,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1}
			},
			time = 10
		},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "inserter"
			}
		},
		order = "a-k-a"
	},
	
	
	
	-- burner miner mk2 research
	{
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
	
	
	
}



--log(format(data.raw.recipe["electric-mining-drill"]))
--for k,v in pairs(data.raw.recipe) do
--	log(tostring(k) .. ": " .. tostring(v))
--end
