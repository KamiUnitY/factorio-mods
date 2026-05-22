local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

aai_util.enable_recipe("iron-stick")
aai_util.enable_recipe("copper-cable")

util.recipe_remove("burner-lab")
util.recipe_remove("burner-assembling-machine")

data:extend({{type = "recipe-category", name = "none"}})
data.raw["assembling-machine"]["burner-assembling-machine"].crafting_categories = {"none"}

util.technology_remove("basic-logistics")
aai_util.tech_lock_recipes("burner-mechanics", {
    "transport-belt",
    "burner-inserter",
    "burner-mining-drill",
})

util.technology_remove("electric-lab")
aai_util.tech_lock_recipes("electronics", {
    "lab",
})
