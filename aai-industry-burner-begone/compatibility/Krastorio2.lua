local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

if mods["Krastorio2"] then
    data.raw.recipe["kr-blank-tech-card"].category = "crafting"
    data.raw.technology["kr-automation-core"].prerequisites = {}
end
