local TrainEntityList = {"fusion-locomotive","fusion-locomotive-mk2","fusion-locomotive-mk3"}

function Contains(tab,element)
	for _,item in pairs(tab) do
		if item == element then
			return true
		end
	end
	return false
end

function ONLOAD()
	global.FusionTrainList = global.FusionTrainList or {}
end

function ONBUILT(event)
	local entity = event.created_entity
	if entity.type == "locomotive" then
		if Contains(TrainEntityList,entity.name) then 
			table.insert(global.FusionTrainList,entity)
		end
	end
end

function ONREMOVE(event)
	local entity = event.entity
	if entity.type == "locomotive" then
		if Contains(TrainEntityList,entity.name) then
			for index,train in pairs(global.FusionTrainList) do
				if entity == train then
					table.remove(global.FusionTrainList,index)
					break
				end
			end
		end
	end
end

function ONTICK()	
	if #global.FusionTrainList == 0 then return end
	for _,train in pairs(global.FusionTrainList) do
		train.energy = train.prototype.max_energy_usage + 1
	end
end

script.on_configuration_changed(function(data) 
	ONLOAD()
	if data and data.mod_changes["FusionTrain"] then
		local trainlist = {}
		local alltrains = game.surfaces[1].find_entities_filtered{type="locomotive"}
		for _,train in pairs(alltrains) do
			if Contains(TrainEntityList,train.name) then
				table.insert(trainlist,train)
			end
		end
		global.FusionTrainList = trainlist
	end
end)

script.on_init(function() ONLOAD() end)
script.on_event(defines.events.on_tick,ONTICK)
script.on_event({defines.events.on_built_entity,defines.events.on_robot_built_entity},ONBUILT)
script.on_event({defines.events.on_preplayer_mined_item,defines.events.on_robot_pre_mined,defines.events.on_entity_died},ONREMOVE)