local util = require("libraries/utility")

data:extend({
  {
    type = "item",
    name = "circuit-board",
    icon = "__kamy-circuit-board__/graphics/icons/circuit-board.png",
    icon_size = 64,
    subgroup = "intermediate-product",
    order = "b[circuit-board]",
    stack_size = 100,
  }
})

data:extend({
  {
    type = "recipe",
    name = "circuit-board-stone-brick",
    enabled = false,
    icon = nil,
    icons = util.sub_icons(data.raw.item["circuit-board"], data.raw.item["stone-brick"]),
    allow_productivity = true,
    auto_recycle = false,
    hide_from_signal_gui = false,
    order = data.raw.item["circuit-board"].order .. "-a",
    energy_required = 0.5,
    ingredients = {
      {type = "item", name = "stone-brick", amount = 1},
    },
    results = {
      {type = "item", name = "circuit-board", amount = 4}
    }
  }
})

data:extend({
  {
    type = "recipe",
    name = "circuit-board-wood",
    enabled = false,
    icon = nil,
    icons = util.sub_icons(data.raw.item["circuit-board"], data.raw.item["wood"]),
    allow_productivity = true,
    auto_recycle = false,
    hide_from_signal_gui = false,
    allow_as_intermediate = false,
    order = data.raw.item["circuit-board"].order .. "-b",
    energy_required = 0.5,
    ingredients = {
      {type = "item", name = "wood", amount = 1},
    },
    results = {
      {type = "item", name = "circuit-board", amount = 2}
    }
  }
})

if mods["space-age"] then
  data:extend({
    {
      type = "recipe",
      name = "stone-brick-bio",
      enabled = false,
      icon = "__kamy-circuit-board__/graphics/icons/stone-brick-bio.png",
      icons = nil,
      allow_productivity = true,
      auto_recycle = false,
      hide_from_signal_gui = false,
      allow_as_intermediate = false,
      subgroup = "agriculture-products",
      order = data.raw.recipe["burnt-spoilage"].order .. "-a[stone-brick]",
      category = "organic",
      energy_required = 2,
      ingredients = {
        {type = "item", name = "carbon", amount = 1},
        {type = "item", name = "spoilage", amount = 3},
      },
      results = {
        {type = "item", name = "stone-brick", amount = 3}
      }
    }
  })
end

data.raw["recipe"]["electronic-circuit"].ingredients = {
    {type = "item", name = "circuit-board", amount = 1},
    {type = "item", name = "copper-cable", amount = 3}
}

if mods["aai-industry"] then
    data.raw["recipe"]["electronic-circuit-wood"] = nil

    if not mods["space-exploration"] then
        data.raw["recipe"]["stone-tablet"] = nil
        data.raw["item"]["stone-tablet"] = nil
    end
end