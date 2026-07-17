local function prototype_remove(name)
    for _, recipe in pairs(data.raw.recipe) do
        if recipe.ingredients then
            for i = #recipe.ingredients, 1, -1 do
                local ingredient = recipe.ingredients[i]
                if (ingredient.name or ingredient[1]) == name then
                    table.remove(recipe.ingredients, i)
                end
            end
        end
    end

    for _, prototypes in pairs(data.raw) do
        prototypes[name] = nil
    end
end

prototype_remove("small-iron-electric-pole")