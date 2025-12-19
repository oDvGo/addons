local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local ethereal_earring = false
local ethereal_earring_slot = 'Ear2'

local warlocks_mantle = true -- Don't add 2% to fastCastValue to this as it is SJ dependant

local heal_hp_threshold_whm = 859
local heal_hp_threshold_rdm = 869

local sets = {
    Idle = {
		Head = 'Wyvern Helm',
        Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Drachen Mail',
		Hands = 'Wyrm Fng.Gnt.',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Wyrm Belt',
		Legs = 'Barone Cosciales',
		Feet = 'Homam Gambieras',
    },
    IdleALT = {},
    Resting = {
		Body = 'Wyvern Mail',
		Feet = 'Wyrm Greaves',
	},
    Town = {
		Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Homam Corazza',
		Hands = 'Homam Manopolas',
		Ring1 = 'Flame Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Wyrm Belt',
		Legs = 'Barone Cosciales',
		Feet = 'Homam Gambieras',
	},
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
		Ear1 = 'Loquac. Earring',
		Ring2 = 'Bomb Queen Ring',
		Back = 'Gigant Mantle',
	},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
		Ear1 = 'Loquac. Earring',
		--Head = 'Drachen Armet',
		Hands = 'Homam Manopolas',
		Waist = 'Swift Belt',
		Feet = 'Homam Gambieras',
	},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Homam Corazza',
		Hands = 'Homam Manopolas',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Swift Belt',
		Legs = 'Barone Cosciales',
		Feet = 'Homam Gambieras',
    },
    TP_HighAcc = {
		Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Homam Corazza',
		Hands = 'Homam Manopolas',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Wyrm Belt',
		Legs = 'Drachen Brais',
		Feet = 'Homam Gambieras',
	},
    TP_Mjollnir_Haste = {
		Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Homam Corazza',
		Hands = 'Homam Manopolas',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Swift Belt',
		Legs = 'Barone Cosciales',
		Feet = 'Homam Gambieras',
	},

    MaxHP = {},
    BreathBonus = {
		Head = 'Wyrm Armet',
		Body = 'Wyvern Mail',
		Hands = 'Ostreger Mitts',
		Legs = 'Drachen Brais',
		Feet = 'Homam Gambieras',
		Ring2 = 'Bomb Queen Ring',
	},
    BreathBonus_NonMage = {
		Head = 'Wyrm Armet',
	},
    Stoneskin = {
		Neck = 'Enhancing Torque',
		Ear1 = 'Loquac. Earring',
		Ear2 = 'Magnetic Earring',
		Head = 'Homam Zucchetto',
		Hands = 'Homam Manopolas',
		Ring1 = 'Aqua Ring',
		Ring2 = 'Tamas Ring',
		Back = 'Merciful Cape',
		Waist = 'Swift Belt',
		Legs = 'Custom pants',
		Feet = 'Homam Gambieras',
	},

    ['Ancient Circle'] = {
	},
    ['Jump'] = {
		Legs = 'Barone Cosciales',
		Feet = 'Drachen Greaves',
		Waist = 'Wyrm Belt',
	},
    ['Jump Accuracy'] = {
		Feet = 'Drachen Greaves',
		Waist = 'Wyrm Belt',
	},
    ['High Jump'] = {
		Legs = 'Wyrm Brais',
		Waist = 'Wyrm Belt',
	},
    ['High Jump Accuracy'] = {
		Feet = 'Drachen Greaves',
		Waist = 'Wyrm Belt',
	},
    ['Super Jump'] = {
		Feet = 'Drachen Greaves',
		Waist = 'Wyrm Belt',
	},
    ['Call Wyvern'] = {},
    ['Spirit Link'] = {
		Head = 'Wyrm Armet',
		Body = 'Wyvern Mail',
		Legs = 'Drachen Brais',
		Feet = 'Homam Gambieras',
		Ring2 = 'Bomb Queen Ring',
		Back = 'Gigant Mantle',
	},

    WS = {
		Head = 'Wyvern Helm',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Custom F Gloves',
		Ring1 = 'Flame Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Wyrm Belt',
		Legs = 'Barone Cosciales',
		Feet = 'Hct. Leggings',
    },
    WS_HighAcc = {
		Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Wyrm Fng.Gnt.',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Wyrm Belt',
		Legs = 'Drachen Brais',
		Feet = 'Hct. Leggings',
	},

    ['Penta Thrust'] = {
		Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Wyrm Fng.Gnt.',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Wyrm Belt',
		Legs = 'Drachen Brais',
		Feet = 'Hct. Leggings',
	},
    ['Wheeling Thrust'] = {
		Head = 'Wyvern Helm',
        Neck = 'Soil Gorget',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Custom F Gloves',
		Ring1 = 'Flame Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Wyrm Belt',
		Legs = 'Barone Cosciales',
		Feet = 'Homam Gambieras',
	},
    ['Impulse Drive'] = {},
    ['Skewer'] = {
		Head = 'Homam Zucchetto',
        Neck = 'Peacock Amulet',
		--Ear1 = 'Minuet Earring',
		--Ear2 = 'Merman\'s Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Custom F Gloves',
		Ring1 = 'Flame Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Wyrm Belt',
		Legs = 'Barone Cosciales',
		Feet = 'Homam Gambieras',
	},
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
	local player = gData.GetPlayer()
    if ((action.Name == 'Jump') or (action.Name == 'High Jump')) and (player.HPP <= 75 and player.TP < 1000) then
		gFunc.Equip('Ring1', 'Drake Ring')
	end
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
