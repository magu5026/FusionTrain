if not settings.startup['vanilla-order'].value then
	data.raw['item-with-entity-data']['fusion-locomotive-1'].subgroup = "fusion-transport"
	data.raw['item-with-entity-data']['fusion-locomotive-1'].order = "a"
	data.raw['item-with-entity-data']['fusion-locomotive-2'].subgroup = "fusion-transport"
	data.raw['item-with-entity-data']['fusion-locomotive-2'].order = "b"
	data.raw['item-with-entity-data']['fusion-locomotive-3'].subgroup = "fusion-transport"
	data.raw['item-with-entity-data']['fusion-locomotive-3'].order = "c"
end

if settings.startup['fusion-mk-train'].value then
	train_tech()
	train_rec()
end

if mods['bobvehicleequipment'] then
	if settings.startup['bobmods-vehicleequipment-enablevehiclegrids'].value then
		data.raw['locomotive']['fusion-locomotive-1'].equipment_grid = "bob-locomotive"
		if settings.startup['fusion-mk-train'] then
			data.raw['locomotive']['fusion-locomotive-2'].equipment_grid = "bob-locomotive-2"
			data.raw['locomotive']['fusion-locomotive-3'].equipment_grid = "bob-locomotive-3"
		end
	end
end


if not mods['boblogistics'] then
	if settings.startup['fusion-mk-train'].value then
		data.raw['cargo-wagon']['cargo-wagon'].max_speed = 2.4
		data.raw['fluid-wagon']['fluid-wagon'].max_speed = 2.4
	end	
end


if mods['Vehicle Wagon'] and settings.startup['fusion-mk-train'].value then
	for _,wagon in pairs(data.raw['cargo-wagon']) do
		if wagon.name:find("vehicle-wagon",1,true) then	
			wagon.max_speed = 2.4
		end
	end
end

if mods["EvenMoreLight"] then
	for _,train in pairs(data.raw['locomotive']) do	
		if train.name:match("^fusion%-locomotive%-%d$") then
			train.front_light =
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
			train.stand_by_light =
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