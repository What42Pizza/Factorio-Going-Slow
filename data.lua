require("utils")



require("data/burner-mining-drill-mk2")
require("data/medium-wood-electric-pole")



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
	
}



--log(format(data.raw.recipe["electric-mining-drill"]))
--for k,v in pairs(data.raw.recipe) do
--	log(tostring(k) .. ": " .. tostring(v))
--end
