require("lib")

function CallRemoteInterface()
	if remote.interfaces["FuelTrainStop"] then
		remote.call("FuelTrainStop", "exclude_from_fuel_schedule", "fusion-locomotive-1")
		remote.call("FuelTrainStop", "exclude_from_fuel_schedule", "fusion-locomotive-2")
		remote.call("FuelTrainStop", "exclude_from_fuel_schedule", "fusion-locomotive-3")
	end
end

function ON_INIT()
	CallRemoteInterface()
end
script.on_init(ON_INIT)

function ON_CONFIGURATION_CHANGED(data)
	CallRemoteInterface()
	
	local mod_name = "FusionTrain"
	if NeedMigration(data,mod_name) then
		local old_version = GetOldVersion(data,mod_name)
		if old_version < "00.17.03" then
			global = {}
		end
	end
end	
script.on_configuration_changed(ON_CONFIGURATION_CHANGED)

function ON_LOAD()
	CallRemoteInterface()
end
script.on_load(ON_LOAD)