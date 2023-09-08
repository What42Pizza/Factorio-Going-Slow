require("utils")



-- increase cost by *4
for _,tech in pairs(data.raw.technology) do
	multiplyTechnologyCost(tech.name, 4, true)
end



-- disable recipes by default

disableRecipeAtStart("steam-engine")
disableRecipeAtStart("small-electric-pole")
disableRecipeAtStart("inserter")
disableRecipeAtStart("electric-mining-drill")
