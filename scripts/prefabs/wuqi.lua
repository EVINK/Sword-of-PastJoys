local attack = require "prefabs.attack"

local assets = {
    Asset("ANIM", "anim/wuqi.zip"), --地上的动画
    Asset("ANIM", "anim/swap_wuqi.zip"), --手里的动画
    Asset("ATLAS", "images/inventoryimages/wuqi.xml"), --加载物品栏贴图
    Asset("IMAGE", "images/inventoryimages/wuqi.tex")
}

local function onequip(inst, owner) --装备
    owner.AnimState:OverrideSymbol("swap_object", "swap_wuqi", "swap_wuqi")
    --替换的动画部件	使用的动画	替换的文件夹（注意这里也是文件夹的名字）
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
    -- Splash attack(AOE)
    if config.aoe ~= 0 then
        owner.components.combat:SetAreaDamage(3, config.aoe)
    end
    if config.light ~= 0 then
        inst.Light:Enable(true)
    end
end

local function onunequip(inst, owner) --解除装备
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    if config.aoe ~= 0 then
        owner.components.combat:SetAreaDamage(-3, -config.aoe)
    end
end

local function onsave(inst, data)
    data.level = inst.level or 0
end

local function onpreload(inst, data)
    if not data or not data.level then
        return
    end
    attack.update_weapon(inst, data.level)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    --inst.entity:AddNetwork()
    if config.light ~= 0 then
        inst.entity:AddLight() -- add light
    end

    MakeInventoryPhysics(inst)

    -- set light (unequipment state)
    if config.light ~= 0 then
        inst.Light:SetIntensity(0.5)
        inst.Light:SetRadius(config.light or 5)
        inst.Light:Enable(true)
        inst.Light:SetFalloff(1)
        inst.Light:SetColour(200 / 255, 200 / 255, 200 / 255)
    end

    inst.AnimState:SetBank("wuqi")
    inst.AnimState:SetBuild("wuqi")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("sharp") --武器的标签跟攻击方式跟攻击音效有关 没有特殊的话就用这两个
    inst:AddTag("pointy")

    inst:AddComponent("talker")
    inst.components.talker.fontsize = 40
    inst.components.talker.font = NUMBERFONT
    inst.components.talker.colour = Vector3(.9, .4, .4)
    inst.components.talker.offset = Vector3(0, 0, 0)
    inst.components.talker.symbol = "swap_object"

    MakeInventoryFloatable(inst, "med", 0.05, {1.1, 0.5, 1.1}, true, -9)

    inst.level = 0

    inst:AddComponent("weapon") --增加武器组件 有了这个才可以打人
    inst.components.weapon:SetDamage(config.init_atk) --设置伤害
    inst.components.weapon:SetOnAttack(attack.on_atk)

    inst:AddComponent("inspectable") --可检查组件

    inst:AddComponent("inventoryitem") --物品组件
    inst.components.inventoryitem.atlasname = "images/inventoryimages/wuqi.xml" --物品贴图

    inst:AddComponent("equippable") --可装备组件
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    inst.components.equippable.walkspeedmult = 1.25 -- 给装备附加额外的移速

    inst:AddComponent("named")
    inst.components.named:SetName(string.format(lang.weapon_gameon_name, 0))

    -- 攻击距离
    inst.components.weapon:SetRange(config.atk_range, config.atk_range)

    inst.OnSave = onsave
    inst.OnPreLoad = onpreload

    -- 设定隔热
    if config.insulator then
        inst:AddComponent("insulator")
        inst.components.insulator:SetInsulation(280)
    end

    -- 防水
    if config.waterproofer then
        inst:AddComponent("waterproofer")
        inst.components.waterproofer:SetEffectiveness(1)
    end

    -- Blink
    if config.blink then
        inst:AddComponent("blinkstaff")
    end

    return inst
end

return Prefab("wuqi", fn, assets)
