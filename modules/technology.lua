local tech_utils = {}

tech_utils.add_recipe_unlock = function(tech_name, recipe_name)
    -- Maybe should do a check if the recipe is already added to this research, or does base factorio do this?
    table.insert(data.raw.technology[tech_name].effects, { type = "unlock-recipe", recipe = recipe_name })
end

tech_utils.add_science_pack = function(tech_name, science_pack_name, multiplier)
    -- Maybe should do a check if the science_pack is already added to this research, or does base factorio do this?
    table.insert(data.raw.technology[tech_name].unit.ingredients, { science_pack_name, multiplier })
end

tech_utils.add_prerequisite = function(tech_name, prerequisite_name)
    local should_add = true

    -- Check if the technology already has this prerequisite
    for _, prerequisite in ipairs(data.raw.technology[tech_name].prerequisites) do
        if prerequisite == prerequisite_name then should_add = false end
    end

    if should_add then
        table.insert(data.raw.technology[tech_name].prerequisites, prerequisite_name)
    end
end

tech_utils.remove_recipe_unlock = function(tech_name, recipe_name)
    for _, unlock in ipairs(data.raw.technology[tech_name].effects) do
        if unlock.type == "unlock-recipe" and unlock.recipe == recipe_name then unlock = nil end
    end
end

tech_utils.remove_science_pack = function(tech_name, science_pack_name)
    for _, pack in ipairs(data.raw.technology[tech_name].unit.ingredients) do
        if pack[1] == science_pack_name then pack = nil end
    end
end

tech_utils.remove_prerequisite = function(tech_name, prerequisite_name)
    for _, prerequisite in ipairs(data.raw.technology[tech_name].prerequisites) do
        if prerequisite == prerequisite_name then prerequisite = nil end
    end
end

tech_utils.replace_prerequisite = function(tech_name, old_prerequisite, new_prerequisite)
    for _, prerequisite in ipairs(data.raw.technology[tech_name].prerequisites) do
        if prerequisite == old_prerequisite then prerequisite = new_prerequisite end
    end
end

tech_utils.set_science_pack_count = function(tech_name, count)
    data.raw.technology[tech_name].unit.count = count
end

return tech_utils