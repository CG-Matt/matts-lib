function matts_oregen_apc(ore, order)
	return
	{
		type = "autoplace-control",
		name = ore,
		localised_name = {"", "[entity=" .. ore .. "] ", {"entity-name." .. ore}},
		richness = true,
		order = order,
		category = "resource"
	}
end

function matts_oregen_nl(ore)
	return
	{
		type = "noise-layer",
		name = ore
	}
end

function matts_oregen_ore(mod, ore, order, colour, mining_time, starting_area_amount, mining_fluid, mining_fluid_amount)
	if mining_time == nil then
		mining_time = 1
	end

	return
	{
		type = "resource",
		name = ore,
		icon_size = 64,
		icon_mipmaps = 4,
		icon = "__" .. mod .. "__/graphics/icons/ores/" .. ore .. "/1.png",
		flags = {"placeable-neutral"},
		order = order,
		collision_box = {{ -0.1, -0.1}, {0.1, 0.1}},
		selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
		stages =
		{
			sheet =
			{
				filename = "__" .. mod .. "__/graphics/entity/ores/" .. ore .. "/ore.png",
				priority = "extra-high",
				width = 64,
				height = 64,
				frame_count = 8,
				variation_count = 8,
				hr_version =
				{
					filename = "__" .. mod .. "__/graphics/entity/ores/" .. ore .. "/hr-ore.png",
					priority = "extra-high",
					size = 128,
					frame_count = 8,
					variation_count = 8,
					scale = 0.5
				},
			},
		},
		stage_counts = {15000, 8000, 4000, 2000, 1000, 500, 200, 80},
		map_color = colour,
		minable =
		{
			hardness = 0.9,
			mining_time = mining_time,
			result = ore,
			mining_fluid_amount = mining_fluid_amount,
			required_mining_fluid = mining_fluid
		},
		autoplace =
		{
			order = order,
			control = ore,
			sharpness = 15/16,
			richness_multiplier = 1500,
			richness_multiplier_distance_bonus = 20,
			richness_base = 10,
			coverage = 0.006 / 3,
			peaks =
			{
				{
					noise_layer = ore,
					noise_octaves_difference = -0.85,
					noise_persistence = 0.4
				},
			},
			starting_area_size = 5500 * 0.006 / 3,
			starting_area_amount = starting_area_amount
		}
	}

end

function matts_oregen_item(mod, ore, order, stack_size, subgroup)
	
	return
	{
		type = "item",
		name = ore,
		icon = "__" .. mod .. "__/graphics/icons/ores/" .. ore .. "/1.png",
		icon_size = 64,
		icon_mipmaps = 4,
		pictures =
		{
			{ size = 64, filename = "__" .. mod .. "__/graphics/icons/ores/" .. ore .. "/1.png", scale = 0.25, mipmap_count = 4},
			{ size = 64, filename = "__" .. mod .. "__/graphics/icons/ores/" .. ore .. "/2.png", scale = 0.25, mipmap_count = 4},
			{ size = 64, filename = "__" .. mod .. "__/graphics/icons/ores/" .. ore .. "/3.png", scale = 0.25, mipmap_count = 4},
			{ size = 64, filename = "__" .. mod .. "__/graphics/icons/ores/" .. ore .. "/4.png", scale = 0.25, mipmap_count = 4}
		},
		subgroup = subgroup,
		order = order,
		stack_size = stack_size
	}

end