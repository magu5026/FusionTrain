require("lib")
local MODNAME = "FusionTrain"


function ON_INIT()
	global.FusionTrain = global.FusionTrain or {}
	global.FusionTrain.TrainList = global.FusionTrain.TrainList or {}
end

function ON_CONFIGURATION_CHANGED(data)
	ON_INIT()
	if NeedMigration(data,MODNAME) then
		local old_version = GetOldVersion(data,MODNAME)
		if old_version < "00.16.01" then
			global.FusionTrain.TrainList = {}
			local all_trains = game.surfaces[1].find_entities_filtered{type="locomotive"}			
			for _,train in pairs(all_trains) do
				if train.name:find("fusion-locomotive-mk",1,true) then
					table.insert(global.FusionTrain.TrainList,train) 
				end
			end	
		end
	end
end	

function ON_TICK(event)
	if #global.FusionTrain.TrainList > 0 then
		for _,train in pairs(global.FusionTrain.TrainList) do
			train.energy = train.prototype.max_energy_usage + 1	
		end
	end
end

function ON_BUILT(event)
	local entity = event.created_entity
	if entity.type == "locomotive" then
		if entity.name:find("fusion-locomotive-mk",1,true) then
			table.insert(global.FusionTrain.TrainList,entity)
		end
	end
end

function ON_REMOVE(event)
	local entity = event.entity
	if entity.type == "locomotive" then
		if entity.name:find("fusion-locomotive-mk",1,true) then 
			Remove(global.FusionTrain.TrainList,entity)
		end
	end
end


script.on_init(ON_INIT)
script.on_configuration_changed(ON_CONFIGURATION_CHANGED)
script.on_event(defines.events.on_tick,ON_TICK)
script.on_event({defines.events.on_built_entity,defines.events.on_robot_built_entity},ON_BUILT)
script.on_event({defines.events.on_pre_player_mined_item,defines.events.on_robot_pre_mined,defines.events.on_entity_died},ON_REMOVE)