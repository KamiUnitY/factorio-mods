data.raw.recipe["small-iron-electric-pole"].enabled = false
data.raw.recipe["small-iron-electric-pole"].hidden = true
data.raw.item["small-iron-electric-pole"].subgroup = nil
data.raw.item["small-iron-electric-pole"].order = nil

for i, ingredient in ipairs(data.raw.recipe["medium-electric-pole"].ingredients) do
    if ingredient.name == "small-iron-electric-pole" then
        table.remove(data.raw.recipe["medium-electric-pole"].ingredients, i)
        break
    end
end

for i, effect in ipairs(data.raw["technology"]["electricity"].effects) do
	if effect.recipe == "small-iron-electric-pole" then
		table.remove(data.raw["technology"]["electricity"].effects, i)
		break
	end
end