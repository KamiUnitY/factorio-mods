data.raw.technology["burner-mechanics"].prerequisites = {}
data.raw.technology["burner-mechanics"].research_trigger = {
    type = "craft-item",
    item = "iron-plate",
    count = 10,
}
data.raw.technology["burner-mechanics"].unit = nil

data.raw.technology["electricity"].prerequisites = {}
data.raw.technology["electricity"].research_trigger = {
    type = "craft-item",
    item = "copper-plate",
    count = 10,
}
data.raw.technology["electricity"].unit = nil

data.raw.technology["electronics"].prerequisites = {"burner-mechanics", "electricity"}
data.raw.technology["electronics"].research_trigger = {
    type = "craft-item",
    item = "burner-turbine",
    count = 1,
}
data.raw.technology["electronics"].unit = nil

data.raw.technology["automation-science-pack"].prerequisites = {"electronics"}
data.raw.technology["automation-science-pack"].research_trigger = {
    type = "craft-item",
    item = "lab",
    count = 1,
}
data.raw.technology["automation-science-pack"].unit = nil

data.raw.technology["automation"].prerequisites = {"automation-science-pack"}
data.raw.technology["automation"].unit = {
    count = 10,
    ingredients = {
        {"automation-science-pack", 1},
    },
    time = 10
}

data.raw.technology["logistic-science-pack"].prerequisites = {"automation-science-pack"}
data.raw.technology["basic-fluid-handling"].prerequisites = {"automation-science-pack"}

data.raw.technology["basic-fluid-handling"].unit = {
    count = 20,
    ingredients = {
        {"automation-science-pack", 1},
    },
    time = 10
}

data.raw.technology["steam-power"].prerequisites = {"basic-fluid-handling"}
data.raw.technology["steam-power"].unit = {
    count = 30,
    ingredients = {
        {"automation-science-pack", 1},
    },
    time = 15
}

data.raw.technology["sand-processing"].unit = {
    count = 10,
    ingredients = {
        {"automation-science-pack", 1},
    },
    time = 5
}

data.raw.technology["glass-processing"].unit = {
    count = 20,
    ingredients = {
        {"automation-science-pack", 1},
    },
    time = 5
}

data.raw.technology["electronics"].order = "a"
data.raw.technology["automation-science-pack"].order = "b"

if settings.startup["aai-bb-cheaper-electric-motor"].value then
    data.raw.recipe["electric-motor"].ingredients = {
        {type = "item", name = "iron-gear-wheel", amount = 1},
        {type = "item", name = "copper-cable", amount = 4},
    }
end

data.raw.recipe["inserter"].ingredients = {
    {type="item", name="iron-stick", amount=2},
    {type="item", name="electric-motor", amount=1},
}

data.raw.recipe["lab"].ingredients = {
    {type="item", name="electronic-circuit", amount=10},
    {type="item", name="electric-motor", amount=5},
    {type="item", name="motor", amount=5},
    {type="item", name="stone-brick", amount=5},
}

data.raw.recipe["assembling-machine-1"].ingredients = {
    {type = "item", name = "iron-gear-wheel", amount = 9},
    {type = "item", name = "electric-motor", amount = 3},
    {type = "item", name = "stone-brick", amount = 4},
}

data.raw.recipe["electric-mining-drill"].ingredients = {
    {type = "item", name = "iron-gear-wheel", amount = 6},
    {type = "item", name = "electric-motor", amount = 6},
    {type = "item", name = "stone-brick", amount = 4},
}

local electric_furnace_ingredients = {
    {type = "item", name = "steel-plate", amount = 10},
    {type = "item", name = "advanced-circuit", amount = 5},
    {type = "item", name = "stone-brick", amount = 10},
}
if mods["space-exploration"] then
    table.insert(electric_furnace_ingredients, {type = "item", name = "se-heat-shielding", amount = 1})
end
data.raw.recipe["electric-furnace"].ingredients = electric_furnace_ingredients
