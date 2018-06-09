local f_loc = table.deepcopy(data.raw['locomotive']['locomotive'])
f_loc.name = "fusion-locomotive"
f_loc.minable = {mining_time = 1, result = "fusion-locomotive"}
f_loc.burner =	{
					effectivity = 1,
					fuel_inventory_size = 0
				}
f_loc.max_speed = 1.4
f_loc.max_power = "1200kW"
				
data:extend{f_loc}


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
	}
})


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
		prerequisites = {"railway", "electric-engine", "nuclear-power" },
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
		order = "c-g-a-a-a",
	},
})







