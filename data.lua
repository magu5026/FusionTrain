local locomotive_1_entity = table.deepcopy(data.raw['locomotive']['locomotive'])
locomotive_1_entity.name = "fusion-locomotive-1"
locomotive_1_entity.minable.result = "fusion-locomotive-1"
locomotive_1_entity.burner = nil
locomotive_1_entity.energy_source = {type = "void"}
				
local locomotive_2_entity = table.deepcopy(data.raw['locomotive']['locomotive'])
locomotive_2_entity.name = "fusion-locomotive-2"
locomotive_2_entity.minable.result = "fusion-locomotive-2"
locomotive_2_entity.max_health = 1350
locomotive_2_entity.max_speed = 1.8 
locomotive_2_entity.max_power = "900kW"
locomotive_2_entity.reversing_power_modifier = 0.8
locomotive_2_entity.braking_force = 15
locomotive_2_entity.friction_force = 0.375
locomotive_2_entity.air_resistance = 0.005625
locomotive_2_entity.burner = nil
locomotive_2_entity.energy_source = {type = "void"}
				
local locomotive_3_entity = table.deepcopy(data.raw['locomotive']['locomotive'])
locomotive_3_entity.name = "fusion-locomotive-3"
locomotive_3_entity.minable.result = "fusion-locomotive-3"
locomotive_3_entity.max_health = 1700
locomotive_3_entity.max_speed = 2.4
locomotive_3_entity.max_power = "1200kW"
locomotive_3_entity.reversing_power_modifier = 1
locomotive_3_entity.braking_force = 20
locomotive_3_entity.friction_force = 0.25
locomotive_3_entity.air_resistance = 0.00375
locomotive_3_entity.burner = nil
locomotive_3_entity.energy_source = {type = "void"}

				
data:extend({locomotive_1_entity,locomotive_2_entity,locomotive_3_entity})


local locomotive_1_item = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
locomotive_1_item.name = "fusion-locomotive-1"
locomotive_1_item.order = "a[train-system]-f[diesel-locomotive]-a[fusion-train]-a[fusion-locomotive-1]"
locomotive_1_item.place_result = "fusion-locomotive-1"

local locomotive_2_item = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
locomotive_2_item.name = "fusion-locomotive-2"
locomotive_2_item.order = "a[train-system]-f[diesel-locomotive]-a[fusion-train]-b[fusion-locomotive-2]"
locomotive_2_item.place_result = "fusion-locomotive-2"

local locomotive_3_item = table.deepcopy(data.raw['item-with-entity-data']['locomotive'])
locomotive_3_item.name = "fusion-locomotive-3"
locomotive_3_item.order = "a[train-system]-f[diesel-locomotive]-a[fusion-train]-c[fusion-locomotive-3]"
locomotive_3_item.place_result = "fusion-locomotive-3"


data:extend({locomotive_1_item,locomotive_2_item,locomotive_3_item})


local locomotive_1_recipe = table.deepcopy(data.raw['recipe']['locomotive'])
locomotive_1_recipe.name = "fusion-locomotive-1"
locomotive_1_recipe.ingredients =
	{
		{"locomotive", 1},
		{"nuclear-reactor", 1},
		{"electric-engine-unit", 20},
		{"used-up-uranium-fuel-cell", 20}	
	}
locomotive_1_recipe.result = "fusion-locomotive-1"

local locomotive_2_recipe = table.deepcopy(data.raw['recipe']['locomotive'])
locomotive_2_recipe.name = "fusion-locomotive-2"
locomotive_2_recipe.ingredients =
	{
		{"fusion-locomotive-1", 1},
		{"nuclear-reactor", 1},
		{"electric-engine-unit", 20},
		{"used-up-uranium-fuel-cell", 20}
	}
locomotive_2_recipe.result = "fusion-locomotive-2"

local locomotive_3_recipe = table.deepcopy(data.raw['recipe']['locomotive'])
locomotive_3_recipe.name = "fusion-locomotive-3"
locomotive_3_recipe.ingredients =
	{
		{"fusion-locomotive-2", 1},
		{"nuclear-reactor", 1},
		{"electric-engine-unit", 20},
		{"used-up-uranium-fuel-cell", 20}
	}
locomotive_3_recipe.result = "fusion-locomotive-3"


data:extend({locomotive_1_recipe})
function train_rec()
	data:extend({locomotive_2_recipe,locomotive_3_recipe})
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
				recipe = "fusion-locomotive-1"
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
					recipe = "fusion-locomotive-2"
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
					recipe = "fusion-locomotive-3"
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