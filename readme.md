![Mod Thumbnail](/thumbnail.png)

# Matt's Library

A library mod that provides necessary functions for most of my mods.

## NOTE

If you are interested in using my mods functions for ore generation please read the following:

* matts_oregen_apc -> Autopalce control
* matts_oregen_nl -> Noise Layer
* matts_oregen_ore -> Ore entity
* matts_oregen_item -> Ore item
* matts_generation_ore -> Ore entity (New)

### The following only applies when using the old functions

Translations:

* ore -> Internal ore name, eg. "gold-ore"
* order -> Used for internal ordering of items, entities etc. eg. "a-b-c"
* mod -> Refers to your internal mod name, eg. "matts-lib", please note that the version of the mod is not used
* colour -> The map screen colour of your ore, eg. "{r=0.84, g=0.83, b=0.18}", please note that the values for the colours range from 0 to 1 with a maximum of 3 decimal places
* mining_time -> The mining time multiplier for the ore, set to 1 for default mining time
* starting_area_amount -> The amount of ore to appear in the starting area
* mining_fluid -> OPTIONAL VALUE, name of the fluid required to mine the ore eg. "sulfuric-acid"
* mining_fluid_amount -> OPTIONAL VALUE, numerical amount of fluid required to mine the ore eg. "10"

Icons/Sprite sheets:

* When making icons/sprite sheets for your mod that will be used for ore icons please follow these instructions:
  1. Ore icon VARIANTS must be located under 'your mod name'/graphics/icons/ore/'ore name', and must be named "1.png", "2.png", "3.png" and "4.png".
  2. Ore SPRITESHEETS must be located under 'your mod name'/graphics/entity/ores/'ore name', and must be named "ore.png" and "hr-ore.png"
* Please also note that all functions are INDEPENDENT of each other and can be used separately if only some functions are required.
* For any further questions please start a discussion on the mod page.

### The following only applies when using the new functions

Function format -> matts_generation_ore(mod_properties(as dictionary), ore_properties(as dictionary), autoplace_properties(as dictionary))
The new format follows a more vanilla-ish approach to ore generation

* Valid values for mod_properties:
  * mod_name -> Name of your mod e.g. matts-lib (not required if using custom graphic paths)
  * icon_path ->Specifies the folder in which your ore icon graphic is located (not required if using default path: "graphics/icons")
  * ore_path -> Specifies the folder in which your ore entity graphics are located (not required if using default path: "graphics/entity")
  * prefix -> Specifies a prefix for the ore internal names, can be useful if creating an ore that is common among other mods but want to avoid conflict (optional)
  * custom_paths -> Set to true if you wish to use custom graphic paths that dont follow the structure specified in this mod (optional)
  * custom_icon_path -> Specifies the custom path for the ore icon (required if using custom_paths)
  * custom_ore_path -> Specifies the custom path for the ore entity (required if using custom_paths)
  * custom_hr_ore_path -> Specifies the custom path for the high resolution ore entity (required if using custom_paths)

* Valid values for ore_properties:
  * name -> The name of the ore
  * order -> Specifies the order in which your ore should be placed
  * map_color -> Specifies the map color of the ore
  * category -> Sets the category of a resource (optional)
  * mining_time -> Changes the mining tme from the default of 1 (optional)
  * result -> Makes the mining result different from the ore name (optional)
  * fluid -> Specifies the fluid needed for mining (optional)
  * fluid_amount -> Specifies the amount of fluid needed for mining (optional, default is 10)

* Valid values for autoplace_properties:
  * base_density -> The base amount of the ore patch sizes before multipliers
  * in_starting_area -> Does the resource spawn in the starting area? (optional, false by default)
  * regular_multiplier -> The multiplier for ore amount outside of the starting area (optional, default is 1)
  * starting_area_multiplier -> The multiplier for ore amount inside the starting area (optional, default is 1.1)
