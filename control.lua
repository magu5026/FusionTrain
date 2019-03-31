require("lib")

function ON_INIT()
	global = {}
	global.TrainList = {}
	global.Fuel = game.item_prototypes['nuclear-fuel']
	global.MODNAME = "FusionTrain"
end

function ON_CONFIGURATION_CHANGED(data)
	if NeedMigration(data,MODNAME) then
		local old_version = GetOldVersion(data,MODNAME)
		if old_version < "00.17.01" then
			ON_INIT()
			local all_trains = game.surfaces[1].find_entities_filtered{type="locomotive"}			
			for _,train in pairs(all_trains) do
				if train.name:find("fusion-locomotive-mk",1,true) then
					train.burner.currently_burning = global.Fuel
					train.burner.remaining_burning_fuel = global.Fuel.fuel_value
					table.insert(global.TrainList,train) 
				end
			end	
		end
	end
end	

function ON_NTH_TICK(event)
	if #global.TrainList > 0 then
		for i,train in pairs(global.TrainList) do
			if train and train.valid then
				train.burner.remaining_burning_fuel = global.Fuel.fuel_value
			else
				table.remove(global.TrainList,i)
			end
		end
	end
end

function ON_BUILT(event)
	if event.created_entity and event.created_entity.valid then
		local entity = event.created_entity
		if entity.type == "locomotive" and entity.name:find("fusion-locomotive-mk",1,true) then
			entity.burner.currently_burning = global.Fuel
			entity.burner.remaining_burning_fuel = global.Fuel.fuel_value
			table.insert(global.TrainList,entity)
		end
	end
end





script.on_init(ON_INIT)
script.on_configuration_changed(ON_CONFIGURATION_CHANGED)
script.on_nth_tick(60,ON_NTH_TICK)
script.on_event({defines.events.on_built_entity,defines.events.on_robot_built_entity,defines.events.script_raised_built},ON_BUILT)