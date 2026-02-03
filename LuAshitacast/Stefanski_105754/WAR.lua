local profile = {}

local fastCastValue = 0.02 -- 0% from gear

local sets = {
    Idle = {
		Head = 'Genbu\'s Kabuto',
		Neck = 'Fortitude Torque',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Custom Vest',
		Hands = 'Seiryu\'s Kote',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Byakko\'s Haidate',
		Feet = 'Suzaku\'s Sune-Ate',
	},
    IdleALT = {},
    Resting = {
		Ear1 = 'Sanative Earring',
	},
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

    Precast = {
		Ear2 = 'Loquac. Earring',
	},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
		Waist = 'Swift Belt',
	},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Head = 'Panther Mask',
		Neck = 'Fortitude Torque',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Haubergeon',
		Hands = 'Dusk Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Swift Belt',
		Legs = 'Byakko\'s Haidate',
		Feet = 'Dusk Ledelsens',
	},
    TP_HighAcc = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Haubergeon',
		Hands = 'Luisant Moufles',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Swift Belt',
		Legs = 'Byakko\'s Haidate',
		Feet = 'Luisant Sollerets',
	},

    TP_Aggressor = {
		Head = 'Panther Mask',
		Neck = 'Fortitude Torque',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Haubergeon',
		Hands = 'Dusk Gloves',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Swift Belt',
		Legs = 'Byakko\'s Haidate',
		Feet = 'Dusk Ledelsens',
	},

    WS = {
		--Ammo = 'Bomb Core',
		Hands = 'Pallas\'s Bracelets',
		Ring2 = 'Victory Ring',
		Legs = 'Barone Cosciales',
		Waist = 'Warwolf Belt',
		Feet = 'Marine F Boots',
	},
    WS_HighAcc = {
		Hands = 'Pallas\'s Bracelets',
		Ring2 = 'Victory Ring',
		Waist = 'Warwolf Belt',
	},

    Warcry = {},
    Provoke = {
		Waist = 'Warwolf Belt',
	},

	Ranged = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Body = 'Scp. Harness +1',
		Hands = 'Custom F Gloves',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Sniper\'s Ring',
		Back = 'Amemet Mantle +1',
		Legs = 'Barone Cosciales',
		Feet = 'Custom F Boots',
	},

    DW = {
        Ear1 = 'Stealth Earring',
    },
    SAM = {
        Ear1 = 'Attila\'s Earring',
    },
	
	['Rampage'] = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		--Ear2 = 'Merman\'s Earring',
		--Ear1 = 'Diablos\'s Earring',
		Body = 'Haubergeon',
		Hands = 'Pallas\'s Bracelets',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warrior\'s Stone',
		Legs = 'Warrior\'s Cuisses',
		Feet = 'Hct. Leggings',
	},
	
	['Raging Rush'] = {
		Head = 'Optical Hat',
		Neck = 'Aqua Gorget',
		--Ear2 = 'Merman\'s Earring',
		--Ear1 = 'Diablos\'s Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Pallas\'s Bracelets',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warrior\'s Stone',
		Legs = 'Warrior\'s Cuisses',
		Feet = 'Hct. Leggings',
	},
	
	['Decimation'] = {
		Head = 'Optical Hat',
		Neck = 'Light Gorget',
		--Ear2 = 'Merman\'s Earring',
		--Ear1 = 'Diablos\'s Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Pallas\'s Bracelets',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warrior\'s Stone',
		Legs = 'Warrior\'s Cuisses',
		Feet = 'Hct. Leggings',
	},
	
	['Steel Cyclone'] = {
		Head = 'Genbu\'s Kabuto',
		Neck = 'Aqua Gorget',
		--Ear2 = 'Merman\'s Earring',
		--Ear1 = 'Diablos\'s Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Pallas\'s Bracelets',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Warrior\'s Cuisses',
		Feet = 'Hct. Leggings',
	},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

local WeaponSkills = T{
    'Rampage',
	'Decimation',
	'Steel Cyclone',
	'Raging Rush',
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
    --if (player.SubJob == 'SAM') then
    --    gFunc.EquipSet(sets.SAM)
    --end
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
