local mod_gui = require("mod-gui")

local function destroy_all_buttons(player)
    local button_flow = mod_gui.get_button_flow(player)
    if not button_flow then
        return
    end

    for _, child in pairs(button_flow.children) do
        if child and child.valid then
            child.destroy()
        end
    end

    if button_flow.parent and button_flow.parent.parent and #button_flow.children_names == 0 then
        button_flow.parent.destroy()
    end
end

local function on_player_joined_game(event)
    local player = game.get_player(event.player_index)
    destroy_all_buttons(player)
end

local function on_singleplayer_init()
    for _, player in pairs(game.players) do
        destroy_all_buttons(player)
    end
end

script.on_event(defines.events.on_player_joined_game, on_player_joined_game)
script.on_event(defines.events.on_singleplayer_init, on_singleplayer_init)