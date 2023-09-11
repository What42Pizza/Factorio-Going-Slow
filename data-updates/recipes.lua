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
	"craft time", 3,
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
updateRecipe("splitter", {
	"set item", "electronic-circuit", 1
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

updateRecipe("electric-engine-unit", {
	"remove item", "engine-unit",
	"add item", "steel-plate", 2,
	"add item", "copper-cable", 5
})
updateRecipe("military-science-pack", {
	"set count", 1,
	"remove item", "piercing-rounds-magazine",
	"add item", "firearm-magazine", 2
})
updateRecipe("wall", {
	"set item", "stone-brick", 3
})
updateRecipe("piercing-rounds-magazine", {
	"add item", "firearm-magazine", 2,
	"add item", "steel-plate", 2,
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

updateRecipe("steam-engine"         , {"disable at start"})
updateRecipe("small-electric-pole"  , {"disable at start"})
updateRecipe("inserter"             , {"disable at start"})
updateRecipe("electric-mining-drill", {"disable at start"})
