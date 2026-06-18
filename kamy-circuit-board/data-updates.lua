local util = require("libraries/utility")

table.insert(data.raw["technology"]["electronics"].effects, 1, {type = "unlock-recipe", recipe = "circuit-board-wood"})
table.insert(data.raw["technology"]["electronics"].effects, 1, {type = "unlock-recipe", recipe = "circuit-board-stone-brick"})

if mods["space-age"] then
    util.technology_insert_recipe_after("biochamber", "stone-brick-bio", "burnt-spoilage")
end
