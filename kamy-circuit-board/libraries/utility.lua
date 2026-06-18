local util = {}

util.table = require("libraries/table")

function util.technology_remove(tech_name)
	local tech = data.raw.technology[tech_name]
	if not tech then return end

	for _, successor in pairs(data.raw.technology) do
		local successor_prereq = successor.prerequisites
		if successor_prereq then
			for i = #successor_prereq, 1, -1 do
				if successor_prereq[i] == tech_name then
					table.remove(successor_prereq, i)
                    -- Ensure the removed tech's prerequisites are added to its successors
					for _, tech_prereq in pairs(tech.prerequisites or {}) do
						if not util.table.contains(successor_prereq, tech_prereq) then
							table.insert(successor_prereq, tech_prereq)
						end
					end
				end
			end
		end
	end

    data.raw.technology[tech_name].enabled = false
    data.raw.technology[tech_name].hidden = true
end

function util.technology_remove_ingredients(tech_name, ingredients_to_remove)
    local tech = data.raw.technology[tech_name]

    if not tech or not tech.unit or not tech.unit.ingredients then
        return
    end

    local remove = {}
    for _, name in pairs(ingredients_to_remove) do
        remove[name] = true
    end

    for i = #tech.unit.ingredients, 1, -1 do
        if remove[tech.unit.ingredients[i][1]] then
            table.remove(tech.unit.ingredients, i)
        end
    end
end

function util.technology_insert_recipe_after(technology_name, recipe_name, after_recipe)
    local effects = data.raw.technology[technology_name].effects

    for i, effect in ipairs(effects) do
        if effect.type == "unlock-recipe" and effect.recipe == after_recipe then
            table.insert(effects, i + 1, {
                type = "unlock-recipe",
                recipe = recipe_name
            })
            return true
        end
    end

    return false
end

function util.technology_insert_recipe_before(technology_name, recipe_name, before_recipe)
    local effects = data.raw.technology[technology_name].effects

    for i, effect in ipairs(effects) do
        if effect.type == "unlock-recipe" and effect.recipe == before_recipe then
            table.insert(effects, i, {
                type = "unlock-recipe",
                recipe = recipe_name
            })
			data.raw.recipe[recipe_name].hidden = false
            return true
        end
    end

    return false
end

function util.technology_remove_recipe_effect(recipe_name)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then return end

	for _, tech in pairs(data.raw.technology) do
		local effects = tech.effects
		if effects and #effects > 0 then
			for i = #effects, 1, -1 do
				local effect = effects[i]
				if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
					util.table.remove(effects, i)
				end
			end
		end
	end

    data.raw.recipe[recipe_name].enabled = false
end

function util.recipe_remove(recipe_name)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then return end

	for _, tech in pairs(data.raw.technology) do
		local effects = tech.effects
		if effects and #effects > 0 then
			for i = #effects, 1, -1 do
				local effect = effects[i]
				if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
					util.table.remove(effects, i)
				end
			end
		end
	end

    data.raw.recipe[recipe_name].enabled = false
    data.raw.recipe[recipe_name].hidden = true

	if data.raw.item[recipe_name] then
		data.raw.item[recipe_name].subgroup = nil
		data.raw.item[recipe_name].order = nil
	end
end

function util.recipe_set_ingredient_amount(recipe_name, ingredients)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then return end

	for _, ingredient in pairs(ingredients) do
		local found = false
		for _, existing_ingredient in pairs(recipe.ingredients) do
			if existing_ingredient.name == ingredient.name and existing_ingredient.type == ingredient.type then
				existing_ingredient.amount = ingredient.amount
				found = true
				break
			end
		end

		if not found then
			table.insert(recipe.ingredients, {type = ingredient.type, name = ingredient.name, amount = ingredient.amount})
		end
	end
end

function util.recipe_clear_ingredients(recipe_name, ingredients)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then return end

	local ingredients_to_remove = {}
	for _, ingredient in pairs(ingredients) do
		ingredients_to_remove[ingredient.type .. ":" .. ingredient.name] = true
	end

	for i = #recipe.ingredients, 1, -1 do
		local existing_ingredient = recipe.ingredients[i]
		if ingredients_to_remove[existing_ingredient.type .. ":" .. existing_ingredient.name] then
			table.remove(recipe.ingredients, i)
		end
	end
end

function util.recipe_replace_ingredient(recipe_name, from_ingredient, to_ingredient)
    local recipe = data.raw.recipe[recipe_name]
    if not recipe or not recipe.ingredients then return end

    for _, ingredient in pairs(recipe.ingredients) do
        if ingredient.name == from_ingredient then
            if ingredient.name then
                ingredient.name = to_ingredient
            end
        end
    end
end

function util.sub_icons(main, sub)
  local icons = {
    {
      icon = main.icon,
      icon_size = main.icon_size or 64,
      shift = { 3, 0 }
    },
    {
      icon = sub.icon,
      icon_size = sub.icon_size or 64,
      scale = 0.3,
      shift = { -9, -9 }
    }
  }
  return icons
end

return util
