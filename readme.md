![Mod Thumbnail](/thumbnail.png)

# Matt's Library

A library mod that provides necessary functions for most of my mods.

## NOTE

If you are interested in using my mods functions for ore generation please read the following:

Begin by including the following at the top of the file which you will use the functions in: ```local x = require("__matts-lib__/resource_generation")```, where ```x``` can be any name that you would like.
Then the following functions will be available to you:

* ```x.item(...)``` - Resource Item
* ```x.autoplace(...)``` - Autopalce Control
* ```x.add_resource_to_planet(...)``` - Add Resource To Planet
* ```x.ore(...)``` - Ore entity

### Resource Generation Functions

* ```item(mod_name, ore_name, order, stack_size, subgroup)```:
  * mod_name - Internal name of the mod to which this resource will belong to.
  * ore_name - Internal name of the ore item.
  * order - Used for internal ordering of items.
  * stack_size - The amount that the item should stack to.
  * subgroup - Used for internal grouping of items.

* ```autoplace(resource, order)```:
  * resource - Internal name of the resource to create the autoplace for.
  * order - Used for internal ordering of items.

* ```add_resource_to_planet(resource, planet)```:
  * resource - Internal name of the resource to create the autoplace for.
  * planet - Internal name of the planet on which you want this resource to appear.

* ```ore(mod_properties, ore_properties, autoplace_properties)```:
  * mod_properties - A table containing the following entries:
    * mod_name - Name of the mod to which the ore will belong.
    * icon_path - Specifies the folder in which your ore icon graphic is located (not required if using default path: "graphics/icons")
    * ore_path - Specifies the folder in which your ore entity graphics are located (not required if using default path: "graphics/entity")
    * prefix - Specifies a prefix for the ore internal names, can be useful if creating an ore that is common among other mods but want to avoid conflict (optional)
    * custom_paths - Set to true if you wish to use custom graphic paths that dont follow the structure specified in this mod (optional)
    * custom_icon_path - Specifies the custom path for the ore icon (required if using custom_paths)
    * custom_ore_path - Specifies the custom path for the ore entity (required if using custom_paths)
    * custom_hr_ore_path - Specifies the custom path for the high resolution ore entity (required if using custom_paths)
  * ore_properties - A table containing the following entries:
    * name - The name of the ore
    * order - Specifies the order in which your ore should be placed
    * map_color - Specifies the map color of the ore
    * category - Sets the category of a resource (optional)
    * mining_time - Changes the mining time from the default of 1 (optional)
    * result - Makes the mining result different from the ore name (optional)
    * fluid - Specifies the fluid needed for mining (optional)
    * fluid_amount - Specifies the amount of fluid needed for mining (optional, default is 10)
  * autoplace_properties - A table containing the following entries:
    * base_density - The base amount of the ore patch sizes before multipliers
    * in_starting_area - Does the resource spawn in the starting area? (optional, false by default)
    * regular_multiplier - The multiplier for ore amount outside of the starting area (optional, default is 1)
    * starting_area_multiplier - The multiplier for ore amount inside the starting area (optional, default is 1.1)

### Example Code
This code gives an example of how to use the ore generation function:
```lua
local matts_resource_gen = require("__matts-lib__/resource_generation")

matts_resource_gen.item("example-mod", "example-ore", "a-a", 50, "raw-resource")
matts_resource_gen.add_resource_to_planet("example-ore", "nauvis")
matts_resource_gen.autoplace("example-ore", "a-a")
matts_resource_gen.ore(
  {
    mod_name = "example-mod",
    ore_path = "graphics/entity/resources"
  },
  {
    name = "example-ore",
    order = "b",
    map_color = {r=0.5, g=0.5, b=0.5},
  },
  {
    base_density = 5
  }
)
```