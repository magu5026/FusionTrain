local function ONLOAD()
	global.TrainList = global.TrainList or {}
end


local function ONTICK()
		
	if global.TrainList ~= nil then
		for index,element in pairs( global.TrainList ) do
			element.energy = 20002
		end
	end
end

local function ONBUILT ( item )
	local entity = item.created_entity
	if entity.name == "fusion-locomotive" then
		table.insert( global.TrainList, entity )
	end
end


local function ONREMOVE ( item )
	local entity = item.entity
	if entity.name == "fusion-locomotive" then
		if global.TrainList ~= nil then
			for index, element in pairs( global.TrainList ) do
				if entity == element then
					global.TrainList[index] = nil
				end
			end
		end
	end
end


script.on_configuration_changed( function() ONLOAD() end )
script.on_init( function() ONLOAD() end )

script.on_event( defines.events.on_tick, ONTICK )
script.on_event( defines.events.on_built_entity, ONBUILT )
script.on_event( defines.events.on_robot_built_entity, ONBUILT )
script.on_event( defines.events.on_preplayer_mined_item, ONREMOVE )
script.on_event( defines.events.on_robot_pre_mined, ONREMOVE )
script.on_event( defines.events.on_entity_died, ONREMOVE )