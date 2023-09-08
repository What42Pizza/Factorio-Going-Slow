require("utils")



-- add steam power

function addSteamPower(ptototype, steamPerSecond, pipe_connections)
	ptototype.energy_source = {
		type = "fluid",
		fluid_usage_per_tick = steamPerSecond / 60.0,
		fluid_box = {
			pipe_connections = pipe_connections
		}
	}
end

local pipeConnections_LR = { -- left, right
	{
		position = {2, 0},
		type = "input-output"
	},
	{
		position = {-2, 0},
		type = "input-output"
	}
}
local pipeConnections_LRTB = { -- left, right, top, bottom
	{
		position = {2, 0},
		type = "input-output"
	},
	{
		position = {-2, 0},
		type = "input-output"
	},
	{
		position = {0, 2},
		type = "input-output"
	},
	{
		position = {0, -2},
		type = "input-output"
	}
}

addSteamPower(data.raw["assembling-machine"]["assembling-machine-1"], 5, pipeConnections_LR)
addSteamPower(data.raw["assembling-machine"]["assembling-machine-2"], 5, pipeConnections_LR)
addSteamPower(data.raw["lab"]["lab"], 10, pipeConnections_LRTB)
addSteamPower(data.raw["mining-drill"]["pumpjack"], 15, pipeConnections_LR)



-- science tweaks

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
removeTechnology("electric-energy-distribution-1")
removeTechnology("electric-energy-distribution-2")
removeTechnology("advanced-material-processing-2")

removeRecipeFromTechnologies("refined-concrete")
removeRecipeFromTechnologies("refined-hazard-concrete")
removeRecipeFromTechnologies("flamethrower-turret")

addScienceToTechnology("gun-turret", "logistic-science-pack", 1)
addScienceToTechnology("military-2", "chemical-science-pack", 1)
addScienceToTechnology("artillery", "space-science-pack", 1)

addScienceToTechnology("speed-module", "chemical-science-pack", 1)
addScienceToTechnology("productivity-module", "chemical-science-pack", 1)
addScienceToTechnology("effectivity-module", "chemical-science-pack", 1)
addScienceToTechnology("speed-module-2", "production-science-pack", 1)
addScienceToTechnology("productivity-module-2", "production-science-pack", 1)
addScienceToTechnology("effectivity-module-2", "production-science-pack", 1)

setTechnologyCost("gun-turret", 50)
setTechnologyCost("speed-module", 100)
setTechnologyCost("productivity-module", 100)
setTechnologyCost("effectivity-module", 100)
setTechnologyCost("speed-module-2", 250)
setTechnologyCost("productivity-module-2", 250)
setTechnologyCost("effectivity-module-2", 250)
setTechnologyCost("automated-rail-transportation", 50)
setTechnologyCost("rail-signals", 50)
setTechnologyCost("fluid-wagon", 50)

updateTechnologyPrerequisites("electronics", {
	"remove", "automation",
	"add", "electric-power"
})
updateTechnologyPrerequisites("automobilism", {
	"remove", "logistics-2",
	"add", "military"
})
updateTechnologyPrerequisites("fast-inserter", {
	"remove", "electronics",
	"add", "inserter"
})
updateTechnologyPrerequisites("fluid-handling", {
	"remove", "automation-2",
	"add", "steel-processing"
})
updateTechnologyPrerequisites("railway", {
	"remove", "logistics-2",
	"add", "logistics",
	"add", "inserter"
})
updateTechnologyPrerequisites("military-science-pack", {
	"remove", "wall",
	"add", "steel-processing"
})
updateTechnologyPrerequisites("gate", {
	"remove", "military-2"
})
updateTechnologyPrerequisites("logistics-2", {
	"remove", "logistic-science-pack",
	"add", "lubricant"
})
updateTechnologyPrerequisites("automation-2", {
	"remove", "electronics",
	"remove", "logistic-science-pack",
	"remove", "steel-processing",
	"add", "logistics-2"
})
updateTechnologyPrerequisites("advanced-material-processing", {
	"remove", "logistic-science-pack",
	"add", "logistics-2"
})

addScienceToTechnology("fast-inserter", "logistic-science-pack", 1)
addScienceToTechnology("fast-inserter", "chemical-science-pack", 1)
addScienceToTechnology("stack-inserter", "chemical-science-pack", 1)
addScienceToTechnology("inserter-capacity-bonus-1", "chemical-science-pack", 1)
addScienceToTechnology("inserter-capacity-bonus-2", "chemical-science-pack", 1)
addScienceToTechnology("inserter-capacity-bonus-3", "production-science-pack", 1)
addScienceToTechnology("logistics-2", "chemical-science-pack", 1)
addScienceToTechnology("logistics-2", "production-science-pack", 1)
addScienceToTechnology("automation-2", "chemical-science-pack", 1)
addScienceToTechnology("automation-2", "production-science-pack", 1)
addScienceToTechnology("advanced-material-processing", "chemical-science-pack", 1)
addScienceToTechnology("advanced-material-processing", "production-science-pack", 1)
addScienceToTechnology("utility-science-pack", "production-science-pack", 1)
addScienceToTechnology("belt-immunity-equipment", "chemical-science-pack", 1)
addScienceToTechnology("battery-equipment", "chemical-science-pack", 1)
addScienceToTechnology("battery-mk2-equipment", "production-science-pack", 1)
addScienceToTechnology("modules", "chemical-science-pack", 1)
addScienceToTechnology("modular-armor", "chemical-science-pack", 1)
addScienceToTechnology("battery", "chemical-science-pack", 1)
addScienceToTechnology("electric-energy-accumulators", "chemical-science-pack", 1)

removeRecipeFromTechnologies("long-handed-inserter")
addRecipeToTechnology("fast-inserter", "long-handed-inserter")



-- recipe tweaks

removeItemFromRecipe("logistic-science-pack", "inserter")
addItemToRecipe("logistic-science-pack", "burner-inserter", 1)

removeItemFromRecipe("transport-belt", "iron-plate")
addItemToRecipe("transport-belt", "copper-plate", 1)

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



-- disable recipes by default

disableRecipeAtStart("steam-engine")
disableRecipeAtStart("small-electric-pole")
disableRecipeAtStart("inserter")
disableRecipeAtStart("electric-mining-drill")



-- make biters harder

-- decrease heavy armor by *0.75
local heavyArmor = data.raw.armor["heavy-armor"]
for _,v in ipairs(heavyArmor.resistances) do
	v.decrease = v.decrease * 0.75
	v.percent = v.percent * 0.75
end

-- decrease turrets by *0.2
do
	local gunTurret = data.raw["ammo-turret"]["gun-turret"]
	local attackParams = gunTurret.attack_parameters
	attackParams.damage_modifier = (attackParams.damage_modifier or 1) * 0.2
	attackParams.ammo_consumption_modifier = (attackParams.ammo_consumption_modifier or 1) * 0.2
end

--for _,unit in pairs(data.raw.unit) do
--	unit.max_health = unit.max_health * 3
--	local attackParams = unit.attack_parameters
--	attackParams.damage_modifier = (attackParams.damage_modifier or 1) * 2
--end



-- misc tweaks

data.raw["assembling-machine"]["assembling-machine-2"].crafting_speed = 1.0

-- idk how to do this
-- actually I think I need to update energy_source
--local electricMiner = data.raw["mining-drill"]["electric-mining-drill"]
--electricMiner.emissions_per_second = electricMiner.emissions_per_second * 0.75
