GLOBAL.setmetatable(
  env,
  {
    __index = function(t, k)
      return GLOBAL.rawget(GLOBAL, k)
    end
  }
)

local config = {
  init_atk = GetModConfigData("init_atk"),
  atk_range = GetModConfigData("atk_range"),
  max_level = GetModConfigData("max_level"),
  lvlup_ways = GetModConfigData("lvlup_ways"),
  level_atk_growth = GetModConfigData("level_atk_growth"),
  addtional_atk = GetModConfigData("addtional_atk"),
  aoe = GetModConfigData("aoe"),
  health_steal = GetModConfigData("health_steal"),
  sanity_steal = GetModConfigData("sanity_steal"),
  waterproofer = GetModConfigData("waterproofer"),
  insulator = GetModConfigData("insulator"),
  light = GetModConfigData("light"),
  blink = GetModConfigData("blink"),
  recipe = GetModConfigData("recipe"),
  lang = GetModConfigData("language")
}
GLOBAL.config = config

local json = GLOBAL.require "libs.json"
local helpers = GLOBAL.require "libs.helpers"

print("user:config:", json.encode(GLOBAL.config))
GLOBAL.lang = helpers.init_language()

PrefabFiles = {
  "wuqi"
}

Assets = {}

STRINGS.NAMES.WUQI = GLOBAL.lang.weapon_name
STRINGS.RECIPE_DESC.WUQI = GLOBAL.lang.weapon_recipe_desc
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WUQI = GLOBAL.lang.characters_generic_desc

--武器
local recipe = {}
if GLOBAL.config.recipe == "easy" then
  recipe = {Ingredient("axe", 1), Ingredient("axe", 1), Ingredient("axe", 1)}
else
  recipe = {Ingredient("nightsword", 2), Ingredient("nightstick", 3), Ingredient("trident", 1)}
end

STRINGS.RECIPE_DESC.GNARWAIL_HORN = GLOBAL.lang.gnarwail_horn_recipe_desc

local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH

if GLOBAL.IsDLCEnabled(GLOBAL.CAPY_DLC) then
  local rcp =
    GLOBAL.Recipe("wuqi", recipe, RECIPETABS.WAR, TECH.SCIENCE_TWO, GLOBAL.RECIPE_GAME_TYPE.COMMON, nil, nil, nil)
  rcp.atlas = "images/inventoryimages/wuqi.xml"
else
  local rcp = GLOBAL.Recipe("wuqi", recipe, RECIPETABS.WAR, TECH.SCIENCE_TWO, nil, nil, nil)
  rcp.atlas = "images/inventoryimages/wuqi.xml"
end
