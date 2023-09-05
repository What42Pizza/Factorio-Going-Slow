require("utils")



-- increase cost by *5
for _,tech in pairs(data.raw.technology) do
	multiplyTechnologyCost(tech.name, 5)
end
