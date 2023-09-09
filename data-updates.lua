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
local pipeConnections_LR_3 = { -- left, right
	{
		position = {3, 0},
		type = "input-output"
	},
	{
		position = {-3, 0},
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
addSteamPower(data.raw["assembling-machine"]["oil-refinery"], 10, 25, pipeConnections_LR_3)
addSteamPower(data.raw["lab"]["lab"], 10, 5, pipeConnections_LRTB)
addSteamPower(data.raw["mining-drill"]["pumpjack"], 15, 15, pipeConnections_LR)



-- science tweaks

updateTechnology("laser"                           , {"disable"})
updateTechnology("laser-turret"                    , {"disable"})
updateTechnology("personal-laser-defense-equipment", {"disable"})
updateTechnology("energy-weapons-damage-1"         , {"disable"})
updateTechnology("energy-weapons-damage-2"         , {"disable"})
updateTechnology("energy-weapons-damage-3"         , {"disable"})
updateTechnology("energy-weapons-damage-4"         , {"disable"})
updateTechnology("energy-weapons-damage-5"         , {"disable"})
updateTechnology("energy-weapons-damage-6"         , {"disable"})
updateTechnology("energy-weapons-damage-7"         , {"disable"})
updateTechnology("laser-shooting-speed-1"          , {"disable"})
updateTechnology("laser-shooting-speed-2"          , {"disable"})
updateTechnology("laser-shooting-speed-3"          , {"disable"})
updateTechnology("laser-shooting-speed-4"          , {"disable"})
updateTechnology("laser-shooting-speed-5"          , {"disable"})
updateTechnology("laser-shooting-speed-6"          , {"disable"})
updateTechnology("laser-shooting-speed-7"          , {"disable"})
updateTechnology("distractor"                      , {"disable"})
updateTechnology("destroyer"                       , {"disable"})
updateTechnology("night-vision-equipment"          , {"disable"})
updateTechnology("speed-module-3"                  , {"disable"})
updateTechnology("productivity-module-3"           , {"disable"})
updateTechnology("effectivity-module-3"            , {"disable"})
updateTechnology("automation-3"                    , {"disable"})
updateTechnology("logistics-3"                     , {"disable"})
updateTechnology("electric-energy-distribution-1"  , {"disable"})
updateTechnology("electric-energy-distribution-2"  , {"disable"})
updateTechnology("advanced-material-processing-2"  , {"disable"})

updateTechnology("concrete", {
	"remove recipe", "refined-concrete",
	"remove recipe", "refined-hazard-concrete"
})

updateTechnology("flamethrower", {"remove recipe", "flamethrower-turret"})

updateTechnology("automation", {"remove recipe", "long-handed-inserter"})
updateTechnology("inserter", {"add recipe", "long-handed-inserter"})

updateTechnology("military-2", {"remove recipe", "piercing-rounds-magazine"})
updateTechnology("military-3", {"add recipe", "piercing-rounds-magazine"})

updateTechnology("robotics", {"disable"})
updateTechnology("electric-engine", {"add recipe", "flying-robot-frame"})

updateTechnology("lubricant", {"disable"})
updateTechnology("advanced-oil-processing", {"add recipe", "lubricant"})

updateTechnology("gun-turret"                   , {"set cost",  50})
updateTechnology("speed-module"                 , {"set cost", 100})
updateTechnology("productivity-module"          , {"set cost", 100})
updateTechnology("effectivity-module"           , {"set cost", 100})
updateTechnology("speed-module-2"               , {"set cost", 250})
updateTechnology("productivity-module-2"        , {"set cost", 250})
updateTechnology("effectivity-module-2"         , {"set cost", 250})
updateTechnology("automated-rail-transportation", {"set cost",  50})
updateTechnology("rail-signals"                 , {"set cost",  50})
updateTechnology("fluid-wagon"                  , {"set cost",  50})
updateTechnology("military-2"                   , {"set cost",  50})
updateTechnology("fast-inserter"                , {"set cost", 100})

updateTechnology("electronics", {
	"remove prereq", "automation",
	"add prereq", "electric-power"
})
updateTechnology("automobilism", {
	"remove prereq", "logistics-2",
	"add prereq", "military"
})
updateTechnology("fast-inserter", {
	"remove prereq", "electronics",
	"add prereq", "inserter"
})
updateTechnology("fluid-handling", {
	"remove prereq", "automation-2",
	"add prereq", "steel-processing"
})
updateTechnology("railway", {
	"remove prereq", "logistics-2",
	"add prereq", "logistics",
	"add prereq", "inserter"
})
updateTechnology("military-science-pack", {
	"remove prereq", "wall",
	"add prereq", "steel-processing"
})
updateTechnology("gate", {
	"remove prereq", "military-2"
})
updateTechnology("logistics-2", {
	"remove prereq", "logistic-science-pack",
	"add prereq", "lubricant"
})
updateTechnology("automation-2", {
	"remove prereq", "electronics",
	"remove prereq", "logistic-science-pack",
	"remove prereq", "steel-processing",
	"add prereq", "logistics-2"
})
updateTechnology("advanced-material-processing", {
	"remove prereq", "logistic-science-pack",
	"add prereq", "logistics-2"
})
updateTechnology("military-2", {
	"remove prereq", "logistic-science-pack"
})
updateTechnology("military-3", {
	"remove prereq", "military-science-pack",
	"add prereq", "military-2"
})
updateTechnology("concrete", {
	"remove prereq", "automation-2",
	"remove prereq", "advanced-material-processing",
	"add prereq", "automobilism",
	"add prereq", "stone-wall"
})
updateTechnology("solar-energy", {
	"add prereq", "railway"
})
updateTechnology("construction-robotics", {
	"remove prereq", "battery",
	"add prereq", "advanced-electronics"
})

updateTechnology("gun-turret"                  , {"add science", "logistic-science-pack", 1})
updateTechnology("military-2"                  , {"add science", "chemical-science-pack", 1})
updateTechnology("artillery"                   , {"add science", "space-science-pack", 1})
updateTechnology("speed-module"                , {"add science", "chemical-science-pack", 1})
updateTechnology("productivity-module"         , {"add science", "chemical-science-pack", 1})
updateTechnology("effectivity-module"          , {"add science", "chemical-science-pack", 1})
updateTechnology("speed-module-2"              , {"add science", "production-science-pack", 1})
updateTechnology("productivity-module-2"       , {"add science", "production-science-pack", 1})
updateTechnology("effectivity-module-2"        , {"add science", "production-science-pack", 1})
updateTechnology("fast-inserter"               , {"add science", "logistic-science-pack", 1})
updateTechnology("fast-inserter"               , {"add science", "chemical-science-pack", 1})
updateTechnology("stack-inserter"              , {"add science", "chemical-science-pack", 1})
updateTechnology("inserter-capacity-bonus-1"   , {"add science", "chemical-science-pack", 1})
updateTechnology("inserter-capacity-bonus-2"   , {"add science", "chemical-science-pack", 1})
updateTechnology("inserter-capacity-bonus-3"   , {"add science", "production-science-pack", 1})
updateTechnology("logistics-2"                 , {"add science", "chemical-science-pack", 1})
updateTechnology("logistics-2"                 , {"add science", "production-science-pack", 1})
updateTechnology("automation-2"                , {"add science", "chemical-science-pack", 1})
updateTechnology("automation-2"                , {"add science", "production-science-pack", 1})
updateTechnology("advanced-material-processing", {"add science", "chemical-science-pack", 1})
updateTechnology("advanced-material-processing", {"add science", "production-science-pack", 1})
updateTechnology("military-2"                  , {"remove science", "chemical-science-pack"})
updateTechnology("stronger-explosives-1"       , {"add science", "military-science-pack", 1})
updateTechnology("utility-science-pack"        , {"add science", "production-science-pack", 1})
updateTechnology("belt-immunity-equipment"     , {"add science", "chemical-science-pack", 1})
updateTechnology("battery-equipment"           , {"add science", "chemical-science-pack", 1})
updateTechnology("battery-mk2-equipment"       , {"add science", "production-science-pack", 1})
updateTechnology("modules"                     , {"add science", "chemical-science-pack", 1})
updateTechnology("modular armor"               , {"add science", "chemical-science-pack", 1})
updateTechnology("battery"                     , {"add science", "chemical-science-pack", 1})
updateTechnology("electric-energy-accumulators", {"add science", "chemical-science-pack", 1})



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
updateRecipe("personal-roboport-equipment", {
	"set item", "battery", 20,
	"set item", "iron-gear-wheel", 10
})
updateRecipe("personal-roboport-mk2-equipment", {
	"set item", "processing-unit", 10,
	"set item", "personal-roboport-equipment", 3
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
updateRecipe("solar-panel", {
	"craft time", 3,
	"set item", "electronic-circuit", 5
})
updateRecipe("pumpjack", {"remove item", "electronic-circuit"})
updateRecipe("repair-pack", {
	"set count", 2,
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



-- misc 

do
	local assemblingMachine1 = data.raw["assembling-machine"]["assembling-machine-1"]
	local assemblingMachine2 = data.raw["assembling-machine"]["assembling-machine-2"]
	assemblingMachine1.fluid_boxes = table.deepcopy(assemblingMachine2.fluid_boxes)
	addItem(assemblingMachine1.crafting_categories, "crafting-with-fluid")
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
