require("utils")



-- add steam power

function addSteamPower(ptototype, steamPerSecond, emissionsPerMinute, pipe_connections)
	ptototype.energy_source = {
		type = "fluid",
		fluid_usage_per_tick = steamPerSecond / 60.0,
		fluid_box = {
			pipe_connections = pipe_connections
		},
		emissions_per_minute = emissionsPerMinute 
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

addSteamPower(data.raw["assembling-machine"]["assembling-machine-1"], 5, 10, pipeConnections_LR)
addSteamPower(data.raw["assembling-machine"]["assembling-machine-2"], 5, 10, pipeConnections_LR)
addSteamPower(data.raw["assembling-machine"]["chemical-plant"], 3, 10, pipeConnections_LR)
addSteamPower(data.raw["lab"]["lab"], 10, 5, pipeConnections_LRTB)
addSteamPower(data.raw["mining-drill"]["pumpjack"], 15, 15, pipeConnections_LR)



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

removeRecipeFromTechnologies("long-handed-inserter")
addRecipeToTechnology("inserter", "long-handed-inserter")

removeRecipeFromTechnologies("piercing-rounds-magazine")
addRecipeToTechnology("military-3", "piercing-rounds-magazine")

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
setTechnologyCost("military-2", 50)
setTechnologyCost("fast-inserter", 100)

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
updateTechnologyPrerequisites("military-2", {
	"remove", "logistic-science-pack"
})
updateTechnologyPrerequisites("military-3", {
	"remove", "military-science-pack",
	"add", "military-2"
})
updateTechnologyPrerequisites("concrete", {
	"remove", "automation-2",
	"remove", "advanced-material-processing",
	"add", "automobilism",
	"add", "stone-wall"
})
updateTechnologyPrerequisites("solar-panel", {
	"add", "railway"
})

addScienceToTechnology("gun-turret", "logistic-science-pack", 1)
addScienceToTechnology("military-2", "chemical-science-pack", 1)
addScienceToTechnology("artillery", "space-science-pack", 1)

addScienceToTechnology("speed-module", "chemical-science-pack", 1)
addScienceToTechnology("productivity-module", "chemical-science-pack", 1)
addScienceToTechnology("effectivity-module", "chemical-science-pack", 1)
addScienceToTechnology("speed-module-2", "production-science-pack", 1)
addScienceToTechnology("productivity-module-2", "production-science-pack", 1)
addScienceToTechnology("effectivity-module-2", "production-science-pack", 1)

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
removeScienceFromTechnology("military-2", "chemical-science-pack", 1)
addScienceToTechnology("stronger-explosives-1", "military-science-pack", 1)
addScienceToTechnology("utility-science-pack", "production-science-pack", 1)
addScienceToTechnology("belt-immunity-equipment", "chemical-science-pack", 1)
addScienceToTechnology("battery-equipment", "chemical-science-pack", 1)
addScienceToTechnology("battery-mk2-equipment", "production-science-pack", 1)
addScienceToTechnology("modules", "chemical-science-pack", 1)
addScienceToTechnology("modular-armor", "chemical-science-pack", 1)
addScienceToTechnology("battery", "chemical-science-pack", 1)
addScienceToTechnology("electric-energy-accumulators", "chemical-science-pack", 1)



-- recipe tweaks

updateRecipe("logistic-science-pack", {
	"remove item", "inserter",
	"add item", "burner-inserter", 1
})
updateRecipe("chemical-science-pack", {
	"craft time", 10,
	"set count", 1
})
updateRecipe("transport-belt", {
	"remove item", "iron-plate",
	"add item", "copper-plate", 1
})
updateRecipe("grenade", {
	"craft time", 2,
	"set item", "coal", 5,
	"set item", "iron-plate", 3
})
updateRecipe("advanced-circuit", {
	"craft time", 3
})

updateRecipe("car", {
	"set item", "engine-unit", 1
})
updateRecipe("engine-unit", {
	"craft time", 3
})
updateRecipe("solar-panel", {"set item", "electronic-circuit", 5})
updateRecipe("pumpjack", {"remove item", "electronic-circuit"})
updateRecipe("repair-pack", {
	"remove item", "electronic-circuit",
	"add item", "iron-plate", 3,
	"add item", "copper-plate", 3,
	"set item", "iron-gear-wheel", 1
})
updateRecipe("gate", {
	"set item", "electronic-circuit", 1,
	"add item", "iron-plate", 5
})
updateRecipe("gun-turret", {
	"set item", "iron-plate", 10,
	"set item", "copper-plate", 5,
	"set item", "iron-gear-wheel", 5,
})
updateRecipe("radar", {"set item", "electronic-circuit", 3})
updateRecipe("landfill", {"add item", "stone", 100})

updateRecipe("assembling-machine-1", {
	"remove item", "electronic-circuit",
	"add item", "burner-inserter", 1
})
updateRecipe("oil-refinery", {
	"remove item", "electronic-circuit",
	"add item", "steel-plate", 20
})
updateRecipe("lab", {
	"remove item", "electronic-circuit",
	"add item", "repair-pack", 3
})

updateRecipe("rail", {"set count", 4})
updateRecipe("locomotive", {
	"set item", "steel-plate", 10,
	"set item", "electronic-circuit", 5,
	"set item", "engine-unit", 10
})
updateRecipe("train-stop", {
	"remove item", "iron-stick",
	"set item", "electronic-circuit", 1
})
updateRecipe("rail-signal", {"set item", "iron-plate", 3})
updateRecipe("rail-chain-signal", {"set item", "iron-plate", 3})
updateRecipe("cargo-wagon", {
	"set item", "iron-plate", 10,
	"set item", "steel-plate", 10,
	"set item", "iron-gear-wheel", 5
})
updateRecipe("fluid-wagon", {
	"set item", "steel-plate", 10,
	"set item", "iron-gear-wheel", 5,
	"set item", "pipe", 5,
})

updateRecipe("speed-module"         , {"add item", "electronic-circuit" , 10})
updateRecipe("speed-module"         , {"add item", "advanced-circuit"   , 10})
updateRecipe("productivity-module"  , {"add item", "electronic-circuit" , 10})
updateRecipe("productivity-module"  , {"add item", "advanced-circuit"   , 10})
updateRecipe("effectivity-module"   , {"add item", "electronic-circuit" , 10})
updateRecipe("effectivity-module"   , {"add item", "advanced-circuit"   , 10})
updateRecipe("speed-module-2"       , {"add item", "advanced-circuit"   , 10})
updateRecipe("speed-module-2"       , {"add item", "processing-unit"    , 10})
updateRecipe("speed-module-2"       , {"add item", "speed-module"       ,  8})
updateRecipe("productivity-module-2", {"add item", "advanced-circuit"   , 10})
updateRecipe("productivity-module-2", {"add item", "processing-unit"    , 10})
updateRecipe("productivity-module-2", {"add item", "productivity-module",  8})
updateRecipe("effectivity-module-2" , {"add item", "advanced-circuit"   , 10})
updateRecipe("effectivity-module-2" , {"add item", "processing-unit"    , 10})
updateRecipe("effectivity-module-2" , {"add item", "effectivity-module" ,  8})



-- disable recipes by default

updateRecipe("steam-engine"         , {"disable at start"})
updateRecipe("small-electric-pole"  , {"disable at start"})
updateRecipe("inserter"             , {"disable at start"})
updateRecipe("electric-mining-drill", {"disable at start"})



-- make biters harder

-- decrease light armor by *0.75
local lightArmor = data.raw.armor["light-armor"]
for _,v in ipairs(lightArmor.resistances) do
	v.decrease = v.decrease * 0.75
	v.percent = v.percent * 0.75
end

-- decrease heavy armor by *0.6
local heavyArmor = data.raw.armor["heavy-armor"]
for _,v in ipairs(heavyArmor.resistances) do
	v.decrease = v.decrease * 0.6
	v.percent = v.percent * 0.6
end

-- decrease turrets by *0.2
do
	local gunTurret = data.raw["ammo-turret"]["gun-turret"]
	local attackParams = gunTurret.attack_parameters
	attackParams.damage_modifier = (attackParams.damage_modifier or 1) * 0.2
	attackParams.ammo_consumption_modifier = (attackParams.ammo_consumption_modifier or 1) * 0.2
end



-- misc tweaks

do
	local assemblingMachine2 = data.raw["assembling-machine"]["assembling-machine-2"]
	assemblingMachine2.crafting_speed = 1.0
end

do
	local steamEngine = data.raw.generator["steam-engine"]
	steamEngine.energy_source.emissions_per_minute = 15
end

do
	local miningDrill2 = data.raw["mining-drill"]["burner-mining-drill-mk2"]
	local energySource = miningDrill2.energy_source
	energySource.emissions_per_minute = energySource.emissions_per_minute * 2
end
