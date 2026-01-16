local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local sets = {
    Idle = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Minuet Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Custom Vest',
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
    Movement = {},

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

    Precast = {},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
		Waist = 'Swift Belt',
	},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Minuet Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Haubergeon',
		Hands = 'Luisant Moufles',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Luisant Brayettes',
		Feet = 'Luisant Sollerets',
	},
    TP_HighAcc = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Minuet Earring',
		Ear2 = 'Diabolos\'s Earring',
		Body = 'Haubergeon',
		Hands = 'Luisant Moufles',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Luisant Brayettes',
		Feet = 'Luisant Sollerets',
	},

    TP_Aggressor = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Minuet Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Haubergeon',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Victory Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Luisant Brayettes',
		Feet = 'Marine F Boots',
	},

    WS = {
		Hands = 'Custom F Gloves',
		Ring2 = 'Victory Ring',
		Waist = 'Life Belt',
	},
    WS_HighAcc = {
		Hands = 'Custom F Gloves',
		Ring2 = 'Victory Ring',
		Waist = 'Life Belt',
	},

    Warcry = {},
    Provoke = {},

	Ranged = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Body = 'Scp. Harness +1',
		Hands = 'Custom F Gloves',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Sniper\'s Ring',
		Legs = 'Republic Subligar',
		Feet = 'Custom F Boots',
	},

    DW = {
        Ear1 = 'Stealth Earring',
    },
    SAM = {
        Ear1 = 'Attila\'s Earring',
    },
	
	['Rampage'] = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Minuet Earring',
		Ear2 = 'Diablos\'s Earring',
		Body = 'Haubergeon',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Luisant Brayettes',
		Feet = 'Marine F Boots',
	},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

local WeaponSkills = T{
    'Rampage',
	'Steel Cyclone',
}

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Warcry') then
        gFunc.EquipSet(sets.Warcry)
    elseif (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Provoke)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
	gFunc.EquipSet(sets.Ranged)
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()
	
	local action = gData.GetAction()
    if (WeaponSkills:contains(action.Name)) then
      gFunc.EquipSet(sets[action.Name])
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'dw'})
    gcdisplay.CreateToggle('DW', false)
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'dw'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'dw') then
        gcdisplay.AdvanceToggle('DW')
        gcinclude.Message('DW', gcdisplay.GetToggle('DW'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    if (player.SubJob == 'SAM') then
        gFunc.EquipSet(sets.SAM)
    end
    if (gcdisplay.GetToggle('DW') and player.Status == 'Engaged') then
        gFunc.EquipSet(sets.DW)
    end

    local aggressor = gData.GetBuffCount('Aggressor')
    if (aggressor == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Aggressor)
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
