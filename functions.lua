local resource_autoplace = require("resource-autoplace")

function matts_generation_ore(mod_properties, ore_properties, autoplace_properties)
	-- Defines mod_name if not defined
	if mod_properties.mod_name == nil then mod_properties.mod_name = "" end

	-- Sets default graphic path
	if mod_properties.icon_path == nil then mod_properties.icon_path = "graphics/icons" end
	if mod_properties.ore_path == nil then mod_properties.ore_path = "graphics/entity" end

	-- Attaches prefix to internal name if one is supplied
	if not mod_properties.prefix == nil then
		ore_properties.name = mod_properties.prefix .. "-" .. ore_properties.name
	end

	-- Sets default mining time
	if ore_properties.mining_time == nil then ore_properties.mining_time = 1 end

	-- Sets mining result to ore name by default, result is only intended to be used when the result is different from the ore name
	if ore_properties.result == nil then ore_properties.result = ore_properties.name end

	-- Sets the default mining fluid amount to 10 if not provided
	if not ore_properties.mining_fluid == nil and ore_properties.mining_fluid_amount == nil then ore_properties.mining_fluid_amount = 10 end

	-- Sets default multipliers
	if autoplace_properties.regular_multiplier == nil then autoplace_properties.regular_multiplier = 1 end
	if autoplace_properties.starting_area_multiplier == nil then autoplace_properties.starting_area_multiplier = 1.1 end

	-- Sets which ore path system it whould use
	if mod_properties.custom_paths == true then
		icon_path = mod_properties.custom_icon_path
		ore_path = mod_properties.custom_ore_path
		hr_ore_path = mod_properties.custom_hr_ore_path
	else
		icon_path = "__" .. mod_properties.mod_name .. "__/" .. mod_properties.icon_path .. "/" .. ore_properties.name .. ".png"
		ore_path = "__" .. mod_properties.mod_name .. "__/" .. mod_properties.ore_path .. "/" .. ore_properties.name .. ".png"
		hr_ore_path = "__" .. mod_properties.mod_name .. "__/" .. mod_properties.ore_path .. "/hr-" .. ore_properties.name .. ".png"
	end

	return
	{
		type = "resource",
		name = ore_properties.name,
		icon = icon_path,
		icon_size = 64, icon_mipmaps = 4,
		flags = {"placeable-neutral"},
		order = ore_properties.order,
		tree_removal_probability = 0.8,
		tree_removal_max_distance = 32 * 32,
		minable =
		{
			-- mining_particle = 
			mining_time = ore_properties.mining_time,
			result = ore_properties.result,
			mining_fluid = ore_properties.fluid,
			mining_fluid_amount = ore_properties.fluid_amount
		},
		-- walking_sound = 
		collision_box = {{-0.1, -0.1},{0.1, 0.1}},
		selection_box = {{-0.5, -0.5},{0.5, 0.5}},
		autoplace = resource_autoplace.resource_autoplace_settings
		{
			name = ore_properties.name,
			order = ore_properties.order,
			base_density = autoplace_properties.base_density,
			has_starting_area_placement = autoplace_properties.in_starting_area,
			regular_rq_factor_multiplier = autoplace_properties.regular_multiplier,
			starting_rq_factor_multiplier = autoplace_properties.starting_area_multiplier
		},
		stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
		stages =
		{
			sheet =
			{
				filename = ore_path,
				priority = "extra-high",
				width = 64,
				height = 64,
				frame_count = 8,
				variation_count = 8,
				hr_version =
				{
					filename = hr_ore_path,
					priority = "extra-high",
					size = 128,
					frame_count = 8,
					variation_count = 8,
					scale = 0.5
				}
			}
		},
		map_color = ore_properties.map_color
	}

end

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