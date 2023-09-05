require("utils")



data:extend{
	{
		type = "technology",
		name = "inserter",
		icon = "__base__/graphics/icons/inserter.png",
		icon_size = 64,
		icon_mipmaps = 4,
		prerequisites = {
			"logistics-2"
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
	{
		type = "technology",
		name = "electric-miner",
		icon = "__base__/graphics/icons/electric-mining-drill.png",
		icon_size = 64,
		icon_mipmaps = 4,
		prerequisites = {
			"production-science-pack"
		},
		unit = {
			count = 200,
			ingredients = {
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 10
		},
		effects = {
			{
				type = "unlock-recipe",
				recipe = "electric-mining-drill"
			}
		},
		order = "a-k-a"
	}
}



--log(format(data.raw.recipe["electric-mining-drill"]))
--for k,v in pairs(data.raw.recipe) do
--	log(tostring(k) .. ": " .. tostring(v))
--end
