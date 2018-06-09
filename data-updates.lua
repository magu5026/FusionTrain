if not settings.startup['vanilla-order'].value then
	data.raw['item-with-entity-data']['fusion-locomotive'].subgroup = "fusion-transport"
	data.raw['item-with-entity-data']['fusion-locomotive'].order = "a"
	data.raw['item-with-entity-data']['fusion-locomotive-mk2'].subgroup = "fusion-transport"
	data.raw['item-with-entity-data']['fusion-locomotive-mk2'].order = "b"
	data.raw['item-with-entity-data']['fusion-locomotive-mk3'].subgroup = "fusion-transport"
	data.raw['item-with-entity-data']['fusion-locomotive-mk3'].order = "c"
end

if settings.startup['mk-train'].value then
	train_tech()
	train_rec()
end

if mods['bobvehicleequipment'] then
	if settings.startup['bobmods-vehicleequipment-enablevehiclegrids'].value then
		data.raw['locomotive']['fusion-locomotive'].equipment_grid = "bob-locomotive"
		if settings.startup['mk-train'] then
			data.raw['locomotive']['fusion-locomotive-mk2'].equipment_grid = "bob-locomotive-2"
			data.raw['locomotive']['fusion-locomotive-mk3'].equipment_grid = "bob-locomotive-3"
		end
	end
end


if not mods['boblogistics'] then
	if settings.startup['mk-train'].value then
		data.raw['cargo-wagon']['cargo-wagon'].max_speed = 3.5
		data.raw['fluid-wagon']['fluid-wagon'].max_speed = 3.5
	end	
end


if mods['Vehicle Wagon'] and settings.startup['mk-train'].value then
	wagons = {"loaded-vehicle-wagon-truck","loaded-vehicle-wagon-tarp","loaded-vehicle-wagon-car","loaded-vehicle-wagon-tank","vehicle-wagon"}
	for _,wagon in pairs(data.raw['fluid-wagon']) do
		if Contains(wagons,wagon.name) then	
			wagon.max_speed = 3.5
		end
	end
end

if mods["EvenMoreLight"] then
	for index,element in pairs(data.raw["locomotive"]) do
		if element.name == "fusion-locomotive"
		or element.name == "fusion-locomotive-mk2"
		or element.name == "fusion-locomotive-mk3" then
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