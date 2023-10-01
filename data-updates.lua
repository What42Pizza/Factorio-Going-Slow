require("utils")



require("data-updates.technologies")
require("data-updates.recipes")



-- add steam power

function addSteamPower(prototype, steamPerSecond, emissionsPerMinute, pipe_connections)
	prototype.energy_source = {
		type = "fluid",
		fluid_usage_per_tick = steamPerSecond / 60.0,
		scale_fluid_usage = true,
		fluid_box = {
			pipe_connections = pipe_connections
		},
		emissions_per_minute = emissionsPerMinute 
	}
	--prototype.energy_usage = multValueWithUnits(prototype.energy_usage, 0.5)
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

addSteamPower(data.raw["assembling-machine"]["assembling-machine-1"], 10, 10, pipeConnections_LR)
addSteamPower(data.raw["assembling-machine"]["assembling-machine-2"], 10, 10, pipeConnections_LR)
addSteamPower(data.raw["assembling-machine"]["chemical-plant"], 20, 10, pipeConnections_LR)
addSteamPower(data.raw["assembling-machine"]["oil-refinery"], 20, 25, pipeConnections_LR_3)
addSteamPower(data.raw["lab"]["lab"], 20, 5, pipeConnections_LRTB)
addSteamPower(data.raw["mining-drill"]["pumpjack"], 25, 5, pipeConnections_LR)

-- decrease chemical plant energy usage
do
	local chemicalPlant = data.raw["assembling-machine"]["chemical-plant"]
	chemicalPlant.energy_usage = multValueWithUnits(chemicalPlant.energy_usage or "210kW", 125/210)
end



-- enemy changes

-- light armor
local lightArmor = data.raw.armor["light-armor"]
for _,v in ipairs(lightArmor.resistances) do
	v.decrease = v.decrease * 0.75
	v.percent = v.percent * 0.75
end

-- heavy armor
local heavyArmor = data.raw.armor["heavy-armor"]
for _,v in ipairs(heavyArmor.resistances) do
	v.decrease = v.decrease * 0.6
	v.percent = v.percent * 0.6
end

-- turrets
do
	local gunTurret = data.raw["ammo-turret"]["gun-turret"]
	local attackParams = gunTurret.attack_parameters
	attackParams.damage_modifier = (attackParams.damage_modifier or 1) * 0.2
	attackParams.ammo_consumption_modifier = (attackParams.ammo_consumption_modifier or 1) * 0.01
end

-- red ammo
do
	local piercingRounds = data.raw.ammo["piercing-rounds-magazine"]
	local ammoType = piercingRounds.ammo_type
	local action = ammoType.action
	local actionDelivery = action.action_delivery
	local targetEffects = actionDelivery.target_effects
	for _,effect in ipairs(targetEffects) do
		if effect.damage then
			effect.damage.amount = effect.damage.amount * 2
		end
	end
end

-- uranium ammo
do
	local uraniumRounds = data.raw.ammo["uranium-rounds-magazine"]
	local ammoType = uraniumRounds.ammo_type
	local action = ammoType.action
	local actionDelivery = action.action_delivery
	local targetEffects = actionDelivery.target_effects
	for _,effect in ipairs(targetEffects) do
		if effect.damage then
			effect.damage.amount = effect.damage.amount * 2
		end
	end
end

-- tank
do
	local tankCannon = data.raw.gun["tank-cannon"]
	tankCannon.attack_parameters.range = 100
	local cannonShell = data.raw.ammo["cannon-shell"]
	cannonShell.ammo_type.action.action_delivery.max_range = 100
	local explosiveCannonShell = data.raw.ammo["explosive-cannon-shell"]
	explosiveCannonShell.ammo_type.action.action_delivery.max_range = 100
end

-- biters
updateUnit("small-biter", {
	"set health", 15,
	"set resistance", "physical", 0, 0
})
updateUnit("medium-biter", {
	"set health", 60,
	"set resistance", "physical", 1, 5
})
updateUnit("big-biter", {
	"set health", 200,
	"set resistance", "physical", 2, 20
})
updateUnit("behemoth-biter", {
	"set health", 500,
	"set resistance", "physical", 5, 30
})
updateUnit("behemoth-spitter", {
	"set health", 1000,
})





-- misc


-- character
do
	local character = data.raw.character.character
	character.inventory_size = (character.inventory_size or 80) + 20
end


-- assembling machines
do
	local assemblingMachine1 = data.raw["assembling-machine"]["assembling-machine-1"]
	local assemblingMachine2 = data.raw["assembling-machine"]["assembling-machine-2"]
	assemblingMachine1.fluid_boxes = table.deepcopy(assemblingMachine2.fluid_boxes)
	addItem(assemblingMachine1.crafting_categories, "crafting-with-fluid")
	assemblingMachine2.crafting_speed = 1.0
end


-- inserters
do
	local fastInserter = data.raw["inserter"]["fast-inserter"]
	fastInserter.energy_per_movement = multValueWithUnits(fastInserter.energy_per_movement or "7kW", 0.5)
	fastInserter.energy_per_rotation = multValueWithUnits(fastInserter.energy_per_rotation or "7kW", 0.5)
end
do
	local filterInserter = data.raw["inserter"]["filter-inserter"]
	filterInserter.energy_per_movement = multValueWithUnits(filterInserter.energy_per_movement or "7kW", 0.5)
	filterInserter.energy_per_rotation = multValueWithUnits(filterInserter.energy_per_rotation or "7kW", 0.5)
end
do
	local stackInserter = data.raw["inserter"]["stack-inserter"]
	stackInserter.energy_per_movement = multValueWithUnits(stackInserter.energy_per_movement or "20kW", 0.25)
	stackInserter.energy_per_rotation = multValueWithUnits(stackInserter.energy_per_rotation or "20kW", 0.25)
end
do
	local stackFilterInserter = data.raw["inserter"]["stack-filter-inserter"]
	stackFilterInserter.energy_per_movement = multValueWithUnits(stackFilterInserter.energy_per_movement or "20kW", 0.25)
	stackFilterInserter.energy_per_rotation = multValueWithUnits(stackFilterInserter.energy_per_rotation or "20kW", 0.25)
end


-- steam engine
do
	local steamEngine = data.raw.generator["steam-engine"]
	steamEngine.energy_source.emissions_per_minute = 15
end


-- mining drills
do
	local miningDrill = data.raw["mining-drill"]["burner-mining-drill"]
	local energySource = miningDrill.energy_source
	energySource.emissions_per_minute = energySource.emissions_per_minute * 0.5
	miningDrill.base_productivity = (miningDrill.base_productivity or 1) * 2
end
do
	local miningDrill2 = data.raw["mining-drill"]["burner-mining-drill-mk2"]
	local energySource = miningDrill2.energy_source
	energySource.emissions_per_minute = energySource.emissions_per_minute * 0.1
	miningDrill2.base_productivity = (miningDrill2.base_productivity or 1) * 4
end


-- robots
do
	local constructionRobot = data.raw["construction-robot"]["construction-robot"]
	local logisticRobot = data.raw["logistic-robot"]["logistic-robot"]
	constructionRobot.speed = constructionRobot.speed * 1.5
	logisticRobot.speed = logisticRobot.speed * 1.5
end
