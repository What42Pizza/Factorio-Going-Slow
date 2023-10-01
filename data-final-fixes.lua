require("utils")



-- increase cost by *4
for _,tech in pairs(data.raw.technology) do
	multiplyTechnologyCost(tech.name, 4, true)
end

log(format(data.raw["assembling-machine"]["chemical-plant"]))
