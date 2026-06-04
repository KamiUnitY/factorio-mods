if mods["aai-industry"] then
    data.raw.item["burner-assembling-machine"].icon = "__kamy-graphics-override__/graphics/icons/burner-assembling-machine.png"
    data.raw["assembling-machine"]["burner-assembling-machine"].icon = "__kamy-graphics-override__/graphics/icons/burner-assembling-machine.png"

    data.raw.technology["basic-fluid-handling"].icon = "__kamy-graphics-override__/graphics/technology/basic-fluid-handling.png"
    
    data.raw.technology["glass-processing"].icon = "__kamy-graphics-override__/graphics/technology/glass-processing.png"
end

if mods["crushing-industry"] then
    data.raw.technology["ore-crushing"].icon = "__kamy-graphics-override__/graphics/technology/ore-crushing.png"
end

if mods["crushing-industry-productivity-research"] then
    local ore_crushing_productivity_icons = util.technology_icon_constant_recipe_productivity("__kamy-graphics-override__/graphics/technology/ore-crushing.png")
    data.raw.technology["ore-crushing-productivity-1"].icons = ore_crushing_productivity_icons
    data.raw.technology["ore-crushing-productivity-2"].icons = ore_crushing_productivity_icons
    data.raw.technology["ore-crushing-productivity-3"].icons = ore_crushing_productivity_icons
end
