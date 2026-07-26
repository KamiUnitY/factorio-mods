local util = require("libraries/utility")

if mods["crushing-industry"] then
    if settings.startup["crushing-industry-coal"].value then
        util.recipe_remove("crushed-grenade")
    end
end