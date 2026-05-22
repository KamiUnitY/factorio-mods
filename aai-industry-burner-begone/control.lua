local FREEPLAY_ITEMS_SHIP = {
  ["iron-chest"] = 1,
  ["burner-inserter"] = 2,
  ["burner-mining-drill"] = 3,
}
local FREEPLAY_ITEMS_DEBRIS = {
  ["iron-plate"] = 24,
  ["copper-cable"] = 8,
}

local function add_items_to_freeplay(storage, items_map)
  local items = remote.call("freeplay", "get_" .. storage .. "_items")
  for item_name, item_amount in pairs(items_map) do
    items[item_name] = (items[item_name] or 0) + item_amount
  end
  remote.call("freeplay", "set_" .. storage .. "_items", items)
end

local function remove_all_items_from_freeplay(storage)
  remote.call("freeplay", "set_" .. storage .. "_items", {})
end

local function init_freeplay_items()
  if not remote.interfaces["freeplay"] then return end

  remove_all_items_from_freeplay("ship")
  remove_all_items_from_freeplay("debris")

  add_items_to_freeplay("ship", FREEPLAY_ITEMS_SHIP)
  add_items_to_freeplay("debris", FREEPLAY_ITEMS_DEBRIS)
end

script.on_init(init_freeplay_items)
