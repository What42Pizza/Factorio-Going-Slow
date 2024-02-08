local physical_projectile_damage = table.deepcopy(data.raw["technology"]["physical-projectile-damage-7"])
physical_projectile_damage.name = "projectile-damage"
physical_projectile_damage.unit = {
	count_formula = "250*L",
	ingredients = {
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"military-science-pack", 1},
		{"utility-science-pack", 1},
		{"space-science-pack", 1},
	},
	time = 60
}
physical_projectile_damage.effects = {
	{
		ammo_category = "bullet",
		modifier = 0.01,
		type = "ammo-damage"
	}
}
physical_projectile_damage.prerequisites = {
	"military-3",
	"space-science-pack"
}



data:extend{
	physical_projectile_damage
}
