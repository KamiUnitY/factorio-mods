local util = require("libraries/utility")
local aai_util = require("__aai-industry__/data-util")

if mods["Krastorio2-spaced-out"] then
    data.raw.technology["electricity"].prerequisites = {"kr-automation-core"}
end
