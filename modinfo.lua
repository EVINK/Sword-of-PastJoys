author = "EvinK"
version = "0.0.2b"
name = "辞欢+"
description = [["辞欢+"基于DST模组【辞欢】而创作，本模组提供了大量可自定义内容，同时降低辞欢剑升级难度

希望你喜欢 ：）

当前版本:]] .. version

forumthread = ""

dst_compatible = true --兼容联机
dont_starve_compatible = false --不兼容单机
reign_of_giants_compatible = false --不兼容巨人
all_clients_require_mod = true --所有人mod

api_version = 10

icon_atlas = "modicon.xml"
icon = "modicon.tex"

server_filter_tags = {"cihuan"} --服务器标签可以不写

local lang =
	ChooseTranslationTable(
	{
		"English",
		["zh"] = "Chinese"
	}
)

configuration_options = {}

if lang == "Chinese" then
	configuration_options = {
		{
			name = "init_atk",
			label = "初始攻击力",
			hover = "",
			options = {
				{description = "17", data = 17},
				{description = "70", data = 70}
			},
			default = 17
		},
		{
			name = "atk_range",
			label = "攻击范围",
			hover = "默认两格，标准为1格",
			options = {
				{description = "1格", data = 1},
				{description = "2格", data = 2}
			},
			default = 2
		},
		{
			name = "max_level",
			label = "武器等级",
			hover = "",
			options = {
				{description = "限制61级", data = 61},
				{description = "限制300级", data = 300},
				{description = "不限", data = 0}
			},
			default = 300
		},
		{
			name = "lvlup_ways",
			label = "升级调控",
			hover = "简单: 击杀怪物有65%的几率升级  经典：原版难度 \n适中: 击杀200血及以上的怪物有33%的几率升级",
			options = {
				{description = "简单", data = "easy"},
				{description = "适中", data = "moderate"},
				{description = "经典", data = "classic"}
			},
			default = "moderate"
		},
		{
			name = "level_atk_growth",
			label = "伤害成长",
			hover = "",
			options = {
				{description = "每级1点", data = 1},
				{description = "每级3点", data = 3}
			},
			default = 1
		},
		{
			name = "addtional_atk",
			label = "附加伤害",
			hover = "每30级按照怪物的当前/最大血量百分比附加额外伤害\n 最多叠加2%（附加伤害也会造成吸血效果）",
			options = {
				{description = "1%当前生命值", data = "current"},
				{description = "1%最大生命值", data = "max"},
				{description = "不附加伤害", data = "0"}
			},
			default = "current"
		},
		{
			name = "aoe",
			label = "溅射伤害",
			hover = "3格范围内的每次攻击造成群体伤害\n默认关闭",
			options = {
				{description = "45%", data = 0.45},
				{description = "25%", data = 0.25},
				{description = "关闭", data = 0}
			},
			default = 0
		},
		{
			name = "health_steal",
			label = "吸血",
			hover = "每次攻击回复一定量的HP\n依玩家设置而定",
			options = {
				{description = "9%", data = 0.09},
				{description = "18%", data = 0.18},
				{description = "45%", data = 0.45},
				{description = "100%(打多少回多少)", data = 1},
				{description = "关", data = 0}
			},
			default = 0.09
		},
		{
			name = "sanity_steal",
			label = "精神回复",
			hover = "每次攻击回复一定量的精神值\n依玩家设置而定",
			options = {
				{description = "9%", data = 0.09},
				{description = "18%", data = 0.18},
				{description = "45%", data = 0.45},
				{description = "100%(打多少回多少)", data = 1},
				{description = "关", data = 0}
			},
			default = 0.09
		},
		{
			name = "waterproofer",
			label = "防水",
			hover = "默认打开",
			options = {
				{description = "开", data = true},
				{description = "关", data = false}
			},
			default = true
		},
		{
			name = "insulator",
			label = "隔热",
			hover = "默认打开",
			options = {
				{description = "开", data = true},
				{description = "关", data = false}
			},
			default = true
		},
		{
			name = "light",
			label = "光照",
			hover = "在夜晚提供光照\n强光(默认)约5半径，弱光约2半径",
			options = {
				{description = "强光", data = 5},
				{description = "弱光", data = 2},
				{description = "关闭", data = 0}
			},
			default = 5
		},
		{
			name = "blink",
			label = "闪现",
			hover = "闪现功能",
			options = {
				{description = "开", data = true},
				{description = "关", data = false}
			},
			default = true
		},
		{
			name = "recipe",
			label = "制作图纸",
			hover = "",
			options = {
				{description = "简单", data = "easy"},
				{description = "经典(原版)", data = "classic"}
			},
			default = "easy"
		},
		{
			name = "language",
			label = "语言",
			hover = "根据您的语言设置，模组已被设置为中文",
			options = {
				{description = lang, data = lang}
			},
			default = lang
		}
	}
else
	name = "Sword of PastJoys"
	description =
		[["Sword of PastJoys" created based on DST mod "辞欢"

the mod adds abundant configurations that player can manually set, and meanwhile it decreases the difficulty for level up of the sword.

Hope you enjoy Sword of PastJoys :)

current version: ]] ..
		version .. [[   contact: EvinK@foxmail.com]]
	configuration_options = {
		{
			name = "init_atk",
			label = "Born Attack",
			hover = "",
			options = {
				{description = "17", data = 17},
				{description = "70", data = 70}
			},
			default = 17
		},
		{
			name = "atk_range",
			label = "Attack Range",
			hover = "Default set to 2 units \n Game standard is 1 unit.",
			options = {
				{description = "1 unit", data = 1},
				{description = "2 units", data = 2}
			},
			default = 2
		},
		{
			name = "max_level",
			label = "Sword Level Limit",
			hover = "",
			options = {
				{description = "Limit to Lv.61", data = 61},
				{description = "Limit to Lv.300", data = 300},
				{description = "Unlimit", data = 0}
			},
			default = 300
		},
		{
			name = "lvlup_ways",
			label = "Sword Level-up Mode",
			hover = "Easy: 65% chance to get a level-up  Classic: original ways (harder) \n Moderate: 33% chance to level up (target HP >= 200)",
			options = {
				{description = "Easy", data = "easy"},
				{description = "Moderate", data = "moderate"},
				{description = "Classic", data = "classic"}
			},
			default = "moderate"
		},
		{
			name = "level_atk_growth",
			label = "Damage Growth",
			hover = "Every time the sword is level up, its basic damage will increase.",
			options = {
				{description = "+1 damage", data = 1},
				{description = "+3 damage", data = 3}
			},
			default = 1
		},
		{
			name = "addtional_atk",
			label = "Extra Damage",
			hover = "Provide extra damage based on target percent HP in every 30 levles.\n Limits to 2%（it works for life/sanity stealing too)",
			options = {
				{description = "1% Current HP", data = "current"},
				{description = "1% Max HP", data = "max"},
				{description = "No Extra Damage", data = "0"}
			},
			default = "current"
		},
		{
			name = "aoe",
			label = "AOE Damage",
			hover = "A splash attack in 3 units. default set to OFF",
			options = {
				{description = "45%", data = 0.45},
				{description = "25%", data = 0.25},
				{description = "OFF", data = 0}
			},
			default = 0
		},
		{
			name = "health_steal",
			label = "Health Steal",
			hover = "Recover your HP，you can specify recover rate",
			options = {
				{description = "9%", data = 0.09},
				{description = "18%", data = 0.18},
				{description = "45%", data = 0.45},
				{description = "100%", data = 1},
				{description = "OFF", data = 0}
			},
			default = 0.09
		},
		{
			name = "sanity_steal",
			label = "Sanity Recover",
			hover = "Recover your sanity，you can specify recover rate",
			options = {
				{description = "9%", data = 0.09},
				{description = "18%", data = 0.18},
				{description = "45%", data = 0.45},
				{description = "100%", data = 1},
				{description = "OFF", data = 0}
			},
			default = 0.09
		},
		{
			name = "waterproofer",
			label = "Water Proof",
			hover = "",
			options = {
				{description = "ON", data = true},
				{description = "OFF", data = false}
			},
			default = true
		},
		{
			name = "insulator",
			label = "Insulate Temperature",
			hover = "",
			options = {
				{description = "ON", data = true},
				{description = "OFF", data = false}
			},
			default = true
		},
		{
			name = "light",
			label = "Light",
			hover = "Provide a light during night.\n Bright(default) is about 5 units，Weak is about 2 units",
			options = {
				{description = "Bright", data = 5},
				{description = "Weak", data = 2},
				{description = "OFF", data = 0}
			},
			default = 5
		},
		{
			name = "blink",
			label = "Blink",
			hover = "Allow you to jump a small distance.",
			options = {
				{description = "ON", data = true},
				{description = "OFF", data = false}
			},
			default = true
		},
		{
			name = "recipe",
			label = "Recipe",
			hover = "",
			options = {
				{description = "Simple", data = "easy"},
				{description = "Classic", data = "classic"}
			},
			default = "easy"
		},
		{
			name = "language",
			label = "Language",
			hover = "According to your Language Setting, this mod has been set to English\n Right now, there is only English/Chinese supported",
			options = {
				{description = lang, data = lang}
			},
			default = lang
		}
	}
end
