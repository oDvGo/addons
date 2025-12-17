local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local ethereal_earring = false
local ethereal_earring_slot = 'Ear2'

local warlocks_mantle = true -- Don't add 2% to fastCastValue to this as it is SJ dependant

local heal_hp_threshold_whm = 859
local heal_hp_threshold_rdm = 869

local sets = {
    Idle = {
		Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Drachen Mail',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Republic Subligar',
		Feet = 'Marine F Boots',
    },
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {
		Legs = 'Crimson Cuisses',
	},

    DT = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {
		Head = 'Drachen Armet',
		Ring2 = 'Bomb Queen Ring',
	},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Head = 'Walkure Mask',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Republic Subligar',
		Feet = 'Marine F Boots',
    },
    TP_HighAcc = {
		Head = 'Walkure Mask',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Battle Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Drachen Brais',
		Feet = 'Marine F Boots',
	},
    TP_Mjollnir_Haste = {},

    MaxHP = {},
    BreathBonus = {
		Head = 'Wyrm Armet',
		Body = 'Wyvern Mail',
		Legs = 'Drachen Brais',
		Feet = 'Homam Gambieras',
		Ring2 = 'Bomb Queen Ring',
	},
    BreathBonus_NonMage = {
		Head = 'Wyrm Armet',
	},
    Stoneskin = {},

    ['Ancient Circle'] = {},
    ['Jump'] = {
		Feet = 'Drachen Greaves',
		Waist = 'Life Belt',
	},
    ['Jump Accuracy'] = {
		Feet = 'Drachen Greaves',
		Waist = 'Life Belt',
	},
    ['High Jump'] = {
		Feet = 'Drachen Greaves',
		Waist = 'Life Belt',
	},
    ['High Jump Accuracy'] = {
		Feet = 'Drachen Greaves',
		Waist = 'Life Belt',
	},
    ['Super Jump'] = {
		Feet = 'Drachen Greaves',
		Waist = 'Life Belt',
	},
    ['Call Wyvern'] = {},
    ['Spirit Link'] = {
		Head = 'Wyrm Armet',
		Body = 'Wyvern Mail',
		Legs = 'Drachen Brais',
		Feet = 'Homam Gambieras',
		Ring2 = 'Bomb Queen Ring',
	},

    WS = {
		Head = 'Walkure Mask',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Republic Subligar',
		Feet = 'Marine F Boots',
    },
    WS_HighAcc = {
		Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Battle Gloves',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Drachen Brais',
		Feet = 'Marine F Boots',
	},

    ['Penta Thrust'] = {
		Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Battle Gloves',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Drachen Brais',
		Feet = 'Marine F Boots',
	},
    ['Wheeling Thrust'] = {
		Head = 'Walkure Mask',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Republic Subligar',
		Feet = 'Marine F Boots',
	},
    ['Impulse Drive'] = {},
    ['Skewer'] = {},
    ['Geirskogul'] = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

local JobAbilities = T{
    'Jump',
    'High Jump',
    'Super Jump',
    'Spirit Link',
    'Call Wyvern',
    'Ancient Circle',
}

local WeaponSkills = T{
    'Impulse Drive',
    'Wheeling Thrust',
    'Skewer',
    'Penta Thrust',
    'Geirskogul',
}

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Steady Wing') then
        gFunc.EquipSet(sets.BreathBonus)
    elseif (JobAbilities:contains(action.Name)) then
        gFunc.EquipSet(sets[action.Name])
    end

    if (gcmelee.GetAccuracyMode() == 'HighAcc') then
        if (action.Name == 'Jump') then
            gFunc.EquipSet('Jump Accuracy')
        elseif (action.Name == 'High Jump') then
            gFunc.EquipSet('High Jump Accuracy')
        end
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (WeaponSkills:contains(action.Name)) then
      gFunc.EquipSet(sets[action.Name])
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local isWHM = player.SubJob == 'WHM'
    local isRDM = player.SubJob == 'RDM'
    local isMage = isWHM or isRDM
    local weakened = gData.GetBuffCount('Weakness')

    if (isWHM and player.HP <= heal_hp_threshold_whm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end
    if (isRDM and player.HP <= heal_hp_threshold_rdm and weakened < 1) then
        gFunc.EquipSet(sets.DT)
    end

    if (ethereal_earring == true and isMage) then
        gFunc.Equip(ethereal_earring_slot, 'Ethereal Earring')
    end

    gcmelee.DoDefaultOverride()

    local petAction = gData.GetPetAction()
    if (petAction ~= nil) then
        if (isMage) then
            gFunc.EquipSet(sets.BreathBonus)
        else
            gFunc.EquipSet(sets.BreathBonus_NonMage)
        end
        return
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    if (player.SubJob == 'RDM' and warlocks_mantle) then
        gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.Equip('Back', 'Warlock\'s Mantle')
    else
        gcmelee.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local player = gData.GetPlayer()
    local action = gData.GetAction()
    if (player.SubJob == 'WHM' or player.SubJob == 'RDM') then
        if (action.Name == 'Stoneskin') then
            gFunc.EquipSet(sets.Stoneskin)
        else
            gFunc.EquipSet(sets.MaxHP)
        end
    end
end

return profile
