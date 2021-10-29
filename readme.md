![Mod Thumbnail](/thumbnail.png)

# Matt's Library

A library mod that provides necessary functions for most of my mods.

## NOTE

If you are interested in using my mods functions for ore generation please read the following:

* matts_oregen_apc -> Autopalce control
* matts_oregen_nl -> Noise Layer
* matts_oregen_ore -> Ore entity
* matts_oregen_item -> Ore item

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
