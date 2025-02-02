local recipe_utils = {}

recipe_utils.add_ingredient = function(recipe_name, ingredient)

    local recipe = data.raw.recipe[recipe_name];

    -- Check if the recipe already has this ingredient
    local has_ingredient = false
    local ingredient_index = 0
    for index, existing_ingredient in ipairs(recipe.ingredients) do
        if existing_ingredient.name == ingredient.name then
            has_ingredient = true
            ingredient_index = index
        end
    end

    -- If it does not just insert it, if it does add to the existing one
    if has_ingredient then
        recipe.ingredients[ingredient_index].amount = recipe.ingredients[ingredient_index].amount + ingredient.amount
        -- Ensure the amount is never negative
        if recipe.ingredients[ingredient_index].amount <= 0 then
            table.remove(recipe.ingredients, ingredient_index)
        end
    else
        if ingredient.amount > 0 then
            table.insert(recipe.ingredients, ingredient)
        end
    end
end

recipe_utils.replace_ingredient = function(recipe_name, old_ingredient, new_ingredient, amount)
    for _, ingredient in ipairs(data.raw.recipe[recipe_name].ingredients) do
        if ingredient.name == old_ingredient then
            ingredient.name = new_ingredient
            if amount ~= nil then
                ingredient.amount = amount
            end
        end
    end
end

recipe_utils.remove_ingredient = function(recipe_name, ingredient_name)
    for idx, ingredient in ipairs(data.raw.recipe[recipe_name].ingredients) do
        if ingredient.name == ingredient_name then
            table.remove(data.raw.recipe[recipe_name].ingredients, idx)
        end
    end
end

recipe_utils.set_ingredients = function(recipe_name, ingredients_table)
    data.raw.recipe[recipe_name].ingredients = {}

    for _, ingredient in ipairs(ingredients_table) do
        table.insert(data.raw.recipe[recipe_name].ingredients, { type = "item", name = ingredient[1], amount = ingredient[2] })
    end
end

return recipe_utils