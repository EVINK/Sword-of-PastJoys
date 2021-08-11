local json = require "libs.json"
local helpers = require "libs.helpers"
local attak = {}

local init_atk = config.init_atk or 17
local level_atk_growth = config.level_atk_growth or 1
local max_level = config.max_level or 300
local lvlup_ways = config.lvlup_ways or "moderate"
local addtional_atk = config.addtional_atk or "0" -- 'current' | 'max' | '0'
local life_steal_rate = config.health_steal or 0
local sanity_steal_rate = config.sanity_steal or 0

-- @dmg: number
-- @player: `Player` object
function __deal_life_steal(dmg, player)
    dmg = dmg or 0
    if not player or dmg == 0 then
        return
    end

    if life_steal_rate ~= 0 then
        player.components.health:DoDelta(life_steal_rate * dmg)
    end

    if sanity_steal_rate ~= 0 then
        player.components.sanity:DoDelta(sanity_steal_rate * dmg)
    end
end

-- 经典升级模型
-- @return lvlup: number
function __classical_lvlup(target_health, randint)
    local lvlup = 0
    if target_health >= 20000 then
        --对于血量大于等于20000的怪物来说，辞欢 20%概率 +1等级
        if randint <= 20 then
            lvlup = 1
        end
    elseif target_health >= 2000 then
        --对于血量大于等于2000，小于20000, 10%概率 +2级
        if randint <= 10 then
            lvlup = 2
        end
    elseif target_health >= 200 then
        --对于血量大于等于200，小于2000, 5%概率 +1级
        if randint <= 5 then
            lvlup = 1
        end
    else
        --对于血量小于200的怪物来说，辞欢1%概率 +1级
        if randint == 1 then
            lvlup = 1
        end
    end

    return lvlup
end

-- update Sword of PastJoys damage
function __do_weapon_update(inst, target_level)
    inst.level = target_level
    local dmg = init_atk + level_atk_growth * target_level
    inst.components.weapon:SetDamage(dmg)
    inst.damage = dmg
    inst.components.named:SetName(string.format(lang.weapon_gameon_name, target_level))
end

-- @target: the Monster we killed
function __after_target_dead(inst, owner, target)
    -- print("if target dead YET?", target.components.health:IsDead())
    if not target.components.health:IsDead() then
        return
    end

    local current_level = inst.level
    if max_level ~= 0 and current_level >= max_level then
        inst.level = max_level
        return __do_weapon_update(inst, max_level)
    end

    local target_health = target.components.health.maxhealth
    local randint = math.random(1, 100)
    local lvlup = 0
    -- print("target health:", target_health)
    -- print("randint:", randint)
    if lvlup_ways == "easy" and randint <= 65 then
        lvlup = 1
    elseif lvlup_ways == "moderate" and target_health >= 200 and randint <= 33 then
        lvlup = 1
    else
        lvlup = __classical_lvlup(target_health, randint)
    end

    if lvlup ~= 0 then
        __do_weapon_update(inst, inst.level + lvlup)
        owner.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
        inst.components.talker:Say(string.format(lang.weapon_level_up, lvlup))
    end
end

function __calculate_additional_dmg(rate, target)
    if addtional_atk == "current" then
        return target.components.health.currenthealth * rate
    elseif addtional_atk == "max" then
        return target.components.health.maxhealth * rate
    else
        return 0
    end
end

function on_atk(inst, owner, target)
    if not inst.level then
        __do_weapon_update(inst, 0)
    elseif not inst.damage then
        __do_weapon_update(inst, inst.level)
    end

    -- calculate damage
    local rate = 0
    if inst.level >= 60 then
        rate = 0.02
    elseif inst.level >= 30 then
        rate = 0.01
    end

    local addtional_dmg = __calculate_additional_dmg(rate, target)
    if addtional_dmg ~= 0 then
        -- print("造成额外伤害:", addtional_dmg)
        target.components.health:DoDelta(-addtional_dmg, nil, nil, true, nil, true)
    end

    local dmg = inst.damage
    dmg = dmg + addtional_dmg

    __deal_life_steal(dmg, owner)
    __after_target_dead(inst, owner, target)
end

attak.on_atk = on_atk
attak.update_weapon = __do_weapon_update
return attak
