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

return util
