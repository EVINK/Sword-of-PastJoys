--GLOBAL相关照抄
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

AddRecipe(
  "wuqi", --添加物品的配方
  recipe,
  RECIPETABS.WAR,
  TECH.SCIENCE_TWO, --制作栏和解锁的科技（这里是战斗，需要科学二本）
  nil,
  nil,
  nil,
  nil,
  nil, --是否有placer  是否有放置的间隔  科技锁  制作的数量（改成2就可以一次做两个） 需要的标签（比如女武神的配方需要女武神的自有标签才可以看得到）
  "images/inventoryimages/wuqi.xml", --配方的贴图（跟物品栏使用同一个贴图）
  "wuqi.tex"
)

STRINGS.RECIPE_DESC.GNARWAIL_HORN = GLOBAL.lang.gnarwail_horn_recipe_desc
AddRecipe(
  "gnarwail_horn",
  {Ingredient("horn", 1), Ingredient("lightninggoathorn", 1), Ingredient("bathbomb", 5)},
  RECIPETABS.REFINE,
  TECH.SCIENCE_TWO
)
