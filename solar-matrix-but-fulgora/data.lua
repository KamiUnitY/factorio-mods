data.raw["recipe"]["solar-matrix"].ingredients = {
    {type = "item", name = "solar-panel", amount = 1},
    {type = "item", name = "superconductor", amount = 5},
    {type = "item", name = "processing-unit", amount = 5},
    {type = "item", name = "steel-plate", amount = 10},
}

data.raw["recipe"]["accumulator-v2"].ingredients = {
    {type = "item", name = "accumulator", amount = 1},
    {type = "item", name = "supercapacitor", amount = 5},
    {type = "item", name = "steel-plate", amount = 4},
}

data.raw["item"]["solar-matrix"].order = data.raw["item"]["solar-panel"].order .. "-a"
data.raw["item"]["accumulator-v2"].order = data.raw["item"]["accumulator"].order .. "-a"
