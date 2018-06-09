if mods["EvenMoreLight"] then

	for index,element in pairs(data.raw["locomotive"]) do
		if element.name == "fusion-locomotive" then
			element.front_light =
				{
					{
						minimum_darkness = 0.3,
						intensity = 0.9,
						size = 60,
					},
					{
						minimum_darkness = 0.3,
						intensity = 0.9,
						size = 60,
					}
				}
			element.stand_by_light =
				{
					{
						minimum_darkness = 0.3,
						color = {b=1},
						shift = {-0.6, -3.5},
						size = 2,
						intensity = 0.5
					},
					{
						minimum_darkness = 0.3,
						color = {b=1},
						shift = {0.6, -3.5},
						size = 2,
						intensity = 0.5
					},
					{
					  minimum_darkness = 0.3,
					  intensity = 0.9,
					  size = 60,
					},
					{
					  minimum_darkness = 0.3,
					  intensity = 0.9,
					  size = 60,
					}
				}
		end				
	end

end