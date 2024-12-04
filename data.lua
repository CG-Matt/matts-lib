data:extend(
{
	{
		-- Matts Resources
		type = "item-group",
		name = "matts-resources",
		order = "w-a",
		icon = "__matts-lib__/graphics/item-group/matts-resources.png",
		icon_size = 64
	},
		{
			-- Matts Resources / Ore's
			type = "item-subgroup",
			name = "matts-ores",
			group = "matts-resources",
			order = "a-a",
		},
		{
			-- Matts Resources / Resources
			type = "item-subgroup",
			name = "matts-resources",
			group = "matts-resources",
			order = "a-b",
		},
		{
			-- Matts Resources / Machines
			type = "item-subgroup",
			name = "matts-machines",
			group = "matts-resources",
			order = "a-c",
		},
		{
			-- Matts Resources / Unsorted
			type = "item-subgroup",
			name = "matts-unsorted",
			group = "matts-resources",
			order = "a-d",
		},
		{
			-- Matts Resources / Basic Fluids
			type = "item-subgroup",
			name = "matts-basic-fluids",
			group = "matts-resources",
			order = "a-e",
		},
		{
			-- Matts Resources / Compound Fluids
			type = "item-subgroup",
			name = "matts-compound-fluids",
			group = "matts-resources",
			order = "a-f",
		},
		{
			-- Matts Resources / Product Fluids
			type = "item-subgroup",
			name = "matts-product-fluids",
			group = "matts-resources",
			order = "a-f",
		},
		{
			-- Matts Resources / Raw Resources
			type = "item-subgroup",
			name = "matts-raw-resources",
			group = "matts-resources",
			order = "a",
		},
		{
			-- Matts Resources / Intermediate Products
			type = "item-subgroup",
			name = "matts-intermediate-products",
			group = "matts-resources",
			order = "b",
		},
		{
			-- Matts Resources / Finished Products
			type = "item-subgroup",
			name = "matts-finished-products",
			group = "matts-resources",
			order = "c",
		},
		{
			-- Matts Resources / Fluids
			type = "item-subgroup",
			name = "matts-fluids",
			group = "matts-resources",
			order = "e",
		},
		{
			-- Matts Resources / Filtration
			type = "item-subgroup",
			name = "matts-filtration",
			group = "matts-resources",
			order = "f",
		},
		{
			-- Matts Resources / Fluid Void
			type = "item-subgroup",
			name = "matts-fluid-void",
			group = "matts-resources",
			order = "g",
		},
})