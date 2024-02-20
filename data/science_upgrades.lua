local upgrade_automation_to_logistic = {
	name = "upgrade-automation-to-logistic",
	type = "recipe",
	energy_required = 0.1,
	ingredients = {
		{"automation-science-pack", 4}
	},
	result = "logistic-science-pack",
	enabled = false,
}

local upgrade_logistic_to_military = {
	name = "upgrade-logistic-to-military",
	type = "recipe",
	energy_required = 0.1,
	ingredients = {
		{"logistic-science-pack", 4}
	},
	result = "military-science-pack",
	enabled = false,
}

local upgrade_military_to_chemical = {
	name = "upgrade-military-to-chemical",
	type = "recipe",
	energy_required = 0.1,
	ingredients = {
		{"military-science-pack", 4}
	},
	result = "chemical-science-pack",
	enabled = false,
}

local upgrade_chemical_to_production = {
	name = "upgrade-chemical-to-production",
	type = "recipe",
	energy_required = 0.1,
	ingredients = {
		{"chemical-science-pack", 4}
	},
	result = "production-science-pack",
	enabled = false,
}

local upgrade_production_to_utility = {
	name = "upgrade-production-to-utility",
	type = "recipe",
	energy_required = 0.1,
	ingredients = {
		{"production-science-pack", 4}
	},
	result = "utility-science-pack",
	enabled = false,
}

local upgrade_utility_to_space = {
	name = "upgrade-utility-to-space",
	type = "recipe",
	energy_required = 0.1,
	ingredients = {
		{"utility-science-pack", 4}
	},
	result = "space-science-pack",
	enabled = false,
}



local science_upgrades = {
	type = "technology",
	name = "science-upgrades",
	icon = "__going-slow__/graphics/icons/science-upgrades-icon.png",
	icon_size = 64,
	icon_mipmaps = 4,
	prerequisites = {
		"space-science-pack"
	},
	unit = {
		count = 2500,
		ingredients = {
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"military-science-pack", 1},
			{"chemical-science-pack", 1},
			{"production-science-pack", 1},
			{"utility-science-pack", 1},
			{"space-science-pack", 1},
		},
		time = 30
	},
	effects = {
		{
			type = "unlock-recipe",
			recipe = "upgrade-automation-to-logistic"
		},
		{
			type = "unlock-recipe",
			recipe = "upgrade-logistic-to-military"
		},
		{
			type = "unlock-recipe",
			recipe = "upgrade-military-to-chemical"
		},
		{
			type = "unlock-recipe",
			recipe = "upgrade-chemical-to-production"
		},
		{
			type = "unlock-recipe",
			recipe = "upgrade-production-to-utility"
		},
		{
			type = "unlock-recipe",
			recipe = "upgrade-utility-to-space"
		},
	},
	order = "a-k-a"
}



data:extend{
	upgrade_automation_to_logistic,
	upgrade_logistic_to_military,
	upgrade_military_to_chemical,
	upgrade_chemical_to_production,
	upgrade_production_to_utility,
	upgrade_utility_to_space,
	science_upgrades,
}
