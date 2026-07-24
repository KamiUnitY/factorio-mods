data.raw.technology["solar-matrix"].prerequisites = {"electromagnetic-science-pack", "solar-energy"}

data.raw.technology["solar-matrix"].unit = {
    count = 1500,
    time = 60,
    ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1},
    },
}

local accumulator_buffer_capacity = tostring(settings.startup["solar-matrix-but-fulgora-accumulator-capacity"].value) .. "MJ"
local accumulator_flow_limit = tostring(settings.startup["solar-matrix-but-fulgora-accumulator-capacity"].value / 10 * 600) .. "kW"

data.raw["accumulator"]["accumulator-v2"].energy_source =
{
    type = "electric",
    buffer_capacity = accumulator_buffer_capacity,
    usage_priority = "tertiary",
    input_flow_limit = accumulator_flow_limit,
    output_flow_limit = accumulator_flow_limit
}

local solar_matrix_production = tostring(settings.startup["solar-matrix-but-fulgora-solar-output"].value) .. "kW"

data.raw["solar-panel"]["solar-matrix"].production = solar_matrix_production
