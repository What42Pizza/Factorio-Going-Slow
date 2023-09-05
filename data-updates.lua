require("utils")



removeTechnology("laser")
removeTechnology("laser-turret")
removeTechnology("personal-laser-defense-equipment")
removeTechnology("energy-weapons-damage-1")
removeTechnology("energy-weapons-damage-2")
removeTechnology("energy-weapons-damage-3")
removeTechnology("energy-weapons-damage-4")
removeTechnology("energy-weapons-damage-5")
removeTechnology("energy-weapons-damage-6")
removeTechnology("energy-weapons-damage-7")
removeTechnology("laser-shooting-speed-1")
removeTechnology("laser-shooting-speed-2")
removeTechnology("laser-shooting-speed-3")
removeTechnology("laser-shooting-speed-4")
removeTechnology("laser-shooting-speed-5")
removeTechnology("laser-shooting-speed-6")
removeTechnology("laser-shooting-speed-7")
removeTechnology("distractor")
removeTechnology("destroyer")
removeTechnology("night-vision-equipment")
removeTechnology("speed-module-3")
removeTechnology("productivity-module-3")
removeTechnology("effectivity-module-3")
removeTechnology("automation-3")
removeTechnology("logistics-3")

removeRecipeFromTechnologies("refined-concrete")
removeRecipeFromTechnologies("refined-hazard-concrete")

addScienceToTechnology("artillery", "space-science-pack", 1)

addScienceToTechnology("speed-module", "chemical-science-pack", 1)
addScienceToTechnology("productivity-module", "chemical-science-pack", 1)
addScienceToTechnology("effectivity-module", "chemical-science-pack", 1)
addScienceToTechnology("speed-module-2", "production-science-pack", 1)
addScienceToTechnology("productivity-module-2", "production-science-pack", 1)
addScienceToTechnology("effectivity-module-2", "production-science-pack", 1)

setTechnologyCost("speed-module", 100)
setTechnologyCost("productivity-module", 100)
setTechnologyCost("effectivity-module", 100)
setTechnologyCost("speed-module-2", 250)
setTechnologyCost("productivity-module-2", 250)
setTechnologyCost("effectivity-module-2", 250)

removeTechnologyPrerequisite("fast-inserter", "electronics")
addTechnologyPrerequisite("fast-inserter", "inserter")





setRecipeEnabled("inserter", false)
setRecipeEnabled("electric-mining-drill", false)

addItemToRecipe("landfill", "stone", 100)

addItemToRecipe("speed-module", "electronic-circuit", 10)
addItemToRecipe("speed-module", "advanced-circuit", 10)
addItemToRecipe("productivity-module", "electronic-circuit", 10)
addItemToRecipe("productivity-module", "advanced-circuit", 10)
addItemToRecipe("effectivity-module", "electronic-circuit", 10)
addItemToRecipe("effectivity-module", "advanced-circuit", 10)
addItemToRecipe("speed-module-2", "advanced-circuit", 10)
addItemToRecipe("speed-module-2", "processing-unit", 10)
addItemToRecipe("speed-module-2", "speed-module", 8)
addItemToRecipe("productivity-module-2", "advanced-circuit", 10)
addItemToRecipe("productivity-module-2", "processing-unit", 10)
addItemToRecipe("productivity-module-2", "productivity-module", 8)
addItemToRecipe("effectivity-module-2", "advanced-circuit", 10)
addItemToRecipe("effectivity-module-2", "processing-unit", 10)
addItemToRecipe("effectivity-module-2", "effectivity-module", 8)
