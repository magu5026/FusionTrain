local f_loc = table.deepcopy(data.raw['locomotive']['locomotive'])
f_loc.name = "fusion-locomotive-mk1"
f_loc.minable.result = "fusion-locomotive-mk1"
f_loc.burner.fuel_inventory_size = 0
				
local f_loc2 = table.deepcopy(data.raw['locomotive']['locomotive'])
f_loc2.name = "fusion-locomotive-mk2"
f_loc2.minable.result = "fusion-locomotive-mk2"
f_loc2.max_health = 1350
f_loc2.max_speed = 1.8 
f_loc2.max_power = "900kW"
f_loc2.burner.fuel_inventory_size = 0
f_loc2.reversing_power_modifier = 0.8
f_loc2.braking_force = 15
f_loc2.friction_force = 0.375
f_loc2.air_resistance = 0.005625
				
local f_loc3 = table.deepcopy(data.raw['locomotive']['locomotive'])
f_loc3.name = "fusion-locomotive-mk3"
f_loc3.minable.result = "fusion-locomotive-mk3"
f_loc3.max_health = 1700
f_loc3.max_speed = 2.4
f_loc3.max_power = "1200kW"
f_loc3.burner.fuel_inventory_size = 0
f_loc3.reversing_power_modifier = 1
f_loc3.braking_force = 20
f_loc3.friction_force = 0.25
f_loc3.air_resistance = 0.00375

				
data:extend({f_loc,f_loc2,f_loc3})


local floc = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
floc.name = "fusion-locomotive-mk1"
floc.order = "a[train-system]-f[diesel-locomotive]-a[fusion-train]-a[fusion-locomotive-mk1]"
floc.place_result = "fusion-locomotive-mk1"

local floc2 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
floc2.name = "fusion-locomotive-mk2"
floc2.order = "a[train-system]-f[diesel-locomotive]-a[fusion-train]-b[fusion-locomotive-mk2]"
floc2.place_result = "fusion-locomotive-mk2"

local floc3 = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
floc3.name = "fusion-locomotive-mk3"
floc3.order = "a[train-system]-f[diesel-locomotive]-a[fusion-train]-c[fusion-locomotive-mk3]"
floc3.place_result = "fusion-locomotive-mk3"


data:extend({floc,floc2,floc3})


local eloc = table.deepcopy(data.raw['recipe']['locomotive'])
eloc.name = "fusion-locomotive-mk1"
eloc.ingredients =
	{
		{"locomotive", 1},
		{"nuclear-reactor", 1},
		{"electric-engine-unit", 20},
		{"used-up-uranium-fuel-cell", 20}	
	}
eloc.result = "fusion-locomotive-mk1"

local eloc2 = table.deepcopy(data.raw['recipe']['locomotive'])
eloc2.name = "fusion-locomotive-mk2"
eloc2.ingredients =
	{
		{"fusion-locomotive-mk1", 1},
		{"nuclear-reactor", 1},
		{"electric-engine-unit", 20},
		{"used-up-uranium-fuel-cell", 20}
	}
eloc2.result = "fusion-locomotive-mk2"

local eloc3 = table.deepcopy(data.raw['recipe']['locomotive'])
eloc3.name = "fusion-locomotive-mk3"
eloc3.ingredients =
	{
		{"fusion-locomotive-mk2", 1},
		{"nuclear-reactor", 1},
		{"electric-engine-unit", 20},
		{"used-up-uranium-fuel-cell", 20}
	}
eloc3.result = "fusion-locomotive-mk3"


data:extend({eloc})
function train_rec()
	data:extend({eloc2,eloc3})
end


data:extend(
{
	{
		type = "technology",
		name = "fusion-railway",
		icon = "__FusionTrain__/graphics/tech.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "fusion-locomotive-mk1"
			}		
		},
		prerequisites = {"production-science-pack", "utility-science-pack", "nuclear-power"},
		unit =
		{
			count = 200,
			ingredients =
			{
				{"automation-science-pack", 4},
				{"logistic-science-pack", 3},
				{"chemical-science-pack", 2},
				{"production-science-pack", 1},
				{"utility-science-pack", 1}
			},
			time = 20
		},
		order = "c-g-a-a-a-a",
	},
})

function train_tech()
	data:extend(
	{
		{
			type = "technology",
			name = "fusion-railway-2",
			icon = "__FusionTrain__/graphics/tech.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "fusion-locomotive-mk2"
				}		
			},
			prerequisites = {"fusion-railway"},
			unit =
			{
				count = 300,
				ingredients =
				{
					{"automation-science-pack", 4},
					{"logistic-science-pack", 3},
					{"chemical-science-pack", 2},
					{"production-science-pack", 1},
					{"utility-science-pack", 1}
				},
				time = 30
			},
			order = "c-g-a-a-a-b",
		},
		{
			type = "technology",
			name = "fusion-railway-3",
			icon = "__FusionTrain__/graphics/tech.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "fusion-locomotive-mk3"
				}		
			},
			prerequisites = {"fusion-railway-2"},
			unit =
			{
				count = 400,
				ingredients =
				{
					{"automation-science-pack", 4},
					{"logistic-science-pack", 3},
					{"chemical-science-pack", 2},
					{"production-science-pack", 1},
					{"utility-science-pack", 1}
				},
				time = 40
			},
			order = "c-g-a-a-a-c",
		},
	})
end

data:extend(
{
	{
		type = "item-subgroup",
		name = "fusion-transport",
		group = "logistics",
		order = "ef",
	},

})