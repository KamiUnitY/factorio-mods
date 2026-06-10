local util = require("libraries/utility")

table.insert(data.raw["technology"]["electronics"].effects, 1, {type = "unlock-recipe", recipe = "circuit-board-wood"})
table.insert(data.raw["technology"]["electronics"].effects, 1, {type = "unlock-recipe", recipe = "circuit-board-stone-brick"})

if mods["space-age"] then
    table.insert(data.raw["technology"]["biochamber"].effects, {type = "unlock-recipe", recipe = "stone-brick-bio"})
end
