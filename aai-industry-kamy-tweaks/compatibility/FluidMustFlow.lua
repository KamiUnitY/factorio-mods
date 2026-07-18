local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

if mods["FluidMustFlow"] then
    util.recipe_replace_ingredient("duct-intake", "engine-unit", "electric-engine-unit")
    util.recipe_replace_ingredient("duct-exhaust", "engine-unit", "electric-engine-unit")
end
