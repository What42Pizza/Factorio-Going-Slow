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
updateTechnology("production-science-pack", {
	"remove prereq", "advanced-material-processing"
})
updateTechnology("logistics-2", {
	"remove prereq", "logistic-science-pack",
	"add prereq", "production-science-pack",
	"add prereq", "advanced-oil-processing",
	"add prereq", "stack-inserter"
})
updateTechnology("automation-2", {
	"remove prereq", "electronics",
	"remove prereq", "logistic-science-pack",
	"remove prereq", "steel-processing",
	"add prereq", "logistics-2",
	"add prereq", "automation"
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
updateTechnology("stack-inserter", {
	"remove prereq", "logistics-2",
	"add prereq", "railway"
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
updateTechnology("military-2"                  , {"remove science", "chemical-science-pack"})
updateTechnology("stronger-explosives-1"       , {"add science", "military-science-pack", 1})
updateTechnology("utility-science-pack"        , {"add science", "production-science-pack", 1})
updateTechnology("belt-immunity-equipment"     , {"add science", "chemical-science-pack", 1})
updateTechnology("battery-equipment"           , {"add science", "chemical-science-pack", 1})
updateTechnology("battery-mk2-equipment"       , {"add science", "production-science-pack", 1})
updateTechnology("modules"                     , {"add science", "chemical-science-pack", 1})
updateTechnology("modular-armor"               , {"add science", "chemical-science-pack", 1})
updateTechnology("solar-panel-equipment"       , {"add science", "chemical-science-pack", 1})
updateTechnology("battery"                     , {"add science", "chemical-science-pack", 1})
updateTechnology("electric-energy-accumulators", {"add science", "chemical-science-pack", 1})
