require("utils")



require("data-updates.technologies")
require("data-updates.recipes")



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
addSteamPower(data.raw["mining-drill"]["pumpjack"], 15, 5, pipeConnections_LR)



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
	attackParams.ammo_consumption_modifier = (attackParams.ammo_consumption_modifier or 1) * 0.1
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
	"set resistance", "physical", 2, 10
})
updateUnit("behemoth-biter", {
	"set health", 500,
	"set resistance", "physical", 2, 10
})
updateUnit("behemoth-spitter", {
	"set health", 1000,
})



-- misc

-- assembling machines
do
	local assemblingMachine1 = data.raw["assembling-machine"]["assembling-machine-1"]
	local assemblingMachine2 = data.raw["assembling-machine"]["assembling-machine-2"]
	assemblingMachine1.fluid_boxes = table.deepcopy(assemblingMachine2.fluid_boxes)
	addItem(assemblingMachine1.crafting_categories, "crafting-with-fluid")
	assemblingMachine2.crafting_speed = 1.0
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
end
do
	local miningDrill2 = data.raw["mining-drill"]["burner-mining-drill-mk2"]
	local energySource = miningDrill2.energy_source
	energySource.emissions_per_minute = energySource.emissions_per_minute * 0.1
end

-- robots
do
	local constructionRobot = data.raw["construction-robot"]["construction-robot"]
	local logisticRobot = data.raw["logistic-robot"]["logistic-robot"]
	constructionRobot.speed = constructionRobot.speed * 1.5
	logisticRobot.speed = logisticRobot.speed * 1.5
end
