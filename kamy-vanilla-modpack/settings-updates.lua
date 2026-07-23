if mods["aai-industry"] then
    data.raw["bool-setting"]["aai-wide-drill"].default_value = false
    data.raw["bool-setting"]["aai-fuel-processor"].default_value = false
end

if mods["crushing-industry"] then
    data.raw["bool-setting"]["crushing-industry-optical-fiber"].default_value = false
    data.raw["bool-setting"]["crushing-industry-concrete-mix"].default_value = false
end

if mods["invincible-construction-bots"] then
    data.raw["bool-setting"]["icb-affect-logi"].default_value = true
end
