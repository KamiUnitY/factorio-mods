if mods["aai-industry"] then
    local aai_util = require("__aai-industry__/data-util")

    data.raw.item["stone-wall"].icon = "__kamy-reskins__/graphics/icons/stone-wall.png"
    aai_util.replace_filenames_recursive(data.raw.wall["stone-wall"].pictures, "__aai-industry__", "__kamy-reskins__")

    data.raw.item["burner-assembling-machine"].icon = "__kamy-reskins__/graphics/icons/burner-assembling-machine.png"
    data.raw["assembling-machine"]["burner-assembling-machine"].icon = "__kamy-reskins__/graphics/icons/burner-assembling-machine.png"

    data.raw.technology["basic-fluid-handling"].icon = "__kamy-reskins__/graphics/technology/basic-fluid-handling.png"

    data.raw.technology["glass-processing"].icon = "__kamy-reskins__/graphics/technology/glass-processing.png"
end

if mods["crushing-industry"] then
    if settings.startup["crushing-industry-ore"].value then
    data.raw.technology["ore-crushing"].icon = "__kamy-reskins__/graphics/technology/ore-crushing.png"
    end

    data.raw.item["burner-crusher"].icon = "__kamy-reskins__/graphics/icons/burner-crusher.png"
    data.raw.item["electric-crusher"].icon = "__kamy-reskins__/graphics/icons/electric-crusher.png"
    data.raw.item["big-crusher"].icon = "__kamy-reskins__/graphics/icons/big-crusher.png"

    data.raw["furnace"]["burner-crusher"].icon = "__kamy-reskins__/graphics/icons/burner-crusher.png"
    data.raw["furnace"]["electric-crusher"].icon = "__kamy-reskins__/graphics/icons/electric-crusher.png"
    data.raw["assembling-machine"]["big-crusher"].icon = "__kamy-reskins__/graphics/icons/big-crusher.png"

    data.raw["furnace"]["burner-crusher"].graphics_set.animation.layers[1].filename = "__kamy-reskins__/graphics/entity/burner-crusher/burner-crusher-base.png"
    data.raw["furnace"]["electric-crusher"].graphics_set.animation.layers[1].filename = "__kamy-reskins__/graphics/entity/electric-crusher/electric-crusher-base.png"
    data.raw["assembling-machine"]["big-crusher"].graphics_set.animation.layers[2].filename = "__kamy-reskins__/graphics/entity/big-crusher/big-crusher-base.png"
end

if mods["crushing-industry-productivity-research"] then
    local ore_crushing_productivity_icons = util.technology_icon_constant_recipe_productivity("__kamy-reskins__/graphics/technology/ore-crushing.png")
    data.raw.technology["ore-crushing-productivity-1"].icons = ore_crushing_productivity_icons
    data.raw.technology["ore-crushing-productivity-2"].icons = ore_crushing_productivity_icons
    data.raw.technology["ore-crushing-productivity-3"].icons = ore_crushing_productivity_icons
end
