local f_loc = table.deepcopy(data.raw['locomotive']['locomotive'])
f_loc.name = "fusion-locomotive"
f_loc.minable.result = "fusion-locomotive"
f_loc.max_speed = 1.2 * 1.15
f_loc.max_power = 600 *1.8 .. "kW"
f_loc.burner.fuel_inventory_size = 0
				
local f_loc2 = table.deepcopy(data.raw['locomotive']['locomotive'])
f_loc2.name = "fusion-locomotive-mk2"
f_loc2.minable.result = "fusion-locomotive-mk2"
f_loc2.max_health = 1350
f_loc2.max_speed = 1.8 * 1.15
f_loc2.max_power = 900 * 1.8 .. "kW"
f_loc2.burner.fuel_inventory_size = 0
f_loc2.reversing_power_modifier = 0.8
f_loc2.braking_force = 15
f_loc2.friction_force = 0.375
f_loc2.air_resistance = 0.005625
				
local f_loc3 = table.deepcopy(data.raw['locomotive']['locomotive'])
f_loc3.name = "fusion-locomotive-mk3"
f_loc3.minable.result = "fusion-locomotive-mk3"
f_loc3.max_health = 1700
f_loc3.max_speed = 2.4 * 1.15
f_loc3.max_power = 1200 * 1.8 .. "kW"
f_loc3.burner.fuel_inventory_size = 0
f_loc3.reversing_power_modifier = 1
f_loc3.braking_force = 20
f_loc3.friction_force = 0.25
f_loc3.air_resistance = 0.00375

				
data:extend({f_loc,f_loc2,f_loc3})


data:extend(
{
	{
		type = "item-with-entity-data",
		name = "fusion-locomotive",
		icon = "__base__/graphics/icons/diesel-locomotive.png",
		flags = {"goes-to-quickbar"},
		subgroup = "transport",
		order = "a[train-system]-f[diesel-locomotive]-a[fusion-locomotive]",
		place_result = "fusion-locomotive",
		stack_size = 5
	},
	{
		type = "item-with-entity-data",
		name = "fusion-locomotive-mk2",
		icon = "__base__/graphics/icons/diesel-locomotive.png",
		flags = {"goes-to-quickbar"},
		subgroup = "transport",
		order = "a[train-system]-f[diesel-locomotive]-b[fusion-locomotive-mk2]",
		place_result = "fusion-locomotive-mk2",
		stack_size = 5
	},
	{
		type = "item-with-entity-data",
		name = "fusion-locomotive-mk3",
		icon = "__base__/graphics/icons/diesel-locomotive.png",
		flags = {"goes-to-quickbar"},
		subgroup = "transport",
		order = "a[train-system]-f[diesel-locomotive]-c[fusion-locomotive-mk3]",
		place_result = "fusion-locomotive-mk3",
		stack_size = 5
	},	
})


data:extend(
{
	{
		type = "recipe",
		name = "fusion-locomotive",
		enabled = false,
		ingredients =
		{
			{"locomotive", 1},
			{"nuclear-reactor", 1},
			{"electric-engine-unit", 20},
			{"uranium-fuel-cell", 10}
		},
		result = "fusion-locomotive"
	},
})
	
function train_rec()
	data:extend(
	{	
		{
			type = "recipe",
			name = "fusion-locomotive-mk2",
			enabled = false,
			ingredients =
			{
				{"fusion-locomotive", 1},
				{"nuclear-reactor", 1},
				{"electric-engine-unit", 20},
				{"uranium-fuel-cell", 10}
			},
			result = "fusion-locomotive-mk2"
		},
		{
			type = "recipe",
			name = "fusion-locomotive-mk3",
			enabled = false,
			ingredients =
			{
				{"fusion-locomotive-mk2", 1},
				{"nuclear-reactor", 1},
				{"electric-engine-unit", 20},
				{"uranium-fuel-cell", 10}
			},
			result = "fusion-locomotive-mk3"
		}
	})
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
				recipe = "fusion-locomotive"
			}		
		},
		prerequisites = {"railway", "electric-engine", "nuclear-power"},
		unit =
		{
			count = 200,
			ingredients =
			{
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
				{"production-science-pack", 1},
				{"high-tech-science-pack", 1}
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
			name = "fusion-railway-mk2",
			icon = "__FusionTrain__/graphics/tech-mk2.png",
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
					{"science-pack-1", 1},
					{"science-pack-2", 1},
					{"science-pack-3", 1},
					{"production-science-pack", 1},
					{"high-tech-science-pack", 1}
				},
				time = 30
			},
			order = "c-g-a-a-a-b",
		},
		{
			type = "technology",
			name = "fusion-railway-mk3",
			icon = "__FusionTrain__/graphics/tech-mk3.png",
			icon_size = 128,
			effects =
			{
				{
					type = "unlock-recipe",
					recipe = "fusion-locomotive-mk3"
				}		
			},
			prerequisites = {"fusion-railway-mk2"},
			unit =
			{
				count = 400,
				ingredients =
				{
					{"science-pack-1", 1},
					{"science-pack-2", 1},
					{"science-pack-3", 1},
					{"production-science-pack", 1},
					{"high-tech-science-pack", 1}
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







