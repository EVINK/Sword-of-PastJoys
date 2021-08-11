local json = require "libs.json"
local helpers = {}

-- @return `Table` object
helpers.get_keys = function(_table)
    local keyset = {}
    local n = 0
    for k, v in pairs(_table) do
        n = n + 1
        keyset[n] = k
    end
    return keyset
end

local en = {
    weapon_name = "Sword of PastJoys",
    weapon_recipe_desc = "Past joyes going throght the late night",
    characters_generic_desc = "Can't sank on those memories right now",
    gnarwail_horn_recipe_desc = "Protect animals, make world better.",
    weapon_gameon_name = "Sword of PastJoys(Lv. %s)",
    weapon_level_up = "Sword of PastJoys is level up by %s"
}

local zh = {
    weapon_name = "辞欢",
    weapon_recipe_desc = "惊鸿难抵梦重重",
    characters_generic_desc = "辞去今朝别往事",
    gnarwail_horn_recipe_desc = "保护珍惜动物，从我做起",
    weapon_gameon_name = "【辞欢剑】当前等级：%s",
    weapon_level_up = "辞欢等级加%s"
}

helpers.init_language = function()
    local language = config.lang or "Chinese"
    if language == "Chinese" then
        return zh
    else
        return en
    end
end

return helpers
