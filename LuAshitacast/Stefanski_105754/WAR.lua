local profile = {}

local fastCastValue = 0.02 -- 0% from gear

local sets = {
    Idle = {
		Ammo = 'Fenrir\'s Stone',
		Head = 'Genbu\'s Kabuto',
		Neck = 'Fortitude Torque',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Kirin\'s Osode',
		Hands = 'Seiryu\'s Kote',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Boxer\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Byakko\'s Haidate',
		Feet = 'Suzaku\'s Sune-Ate',
	},
    IdleALT = {},
    Resting = {
		Ear1 = 'Sanative Earring',
	},
    Town = {},
    Movement = {
		Hands = 'Tarasque Mitts +1',
		Feet = 'Marine F Boots',
	},

    DT = {
		Ammo = 'Happy Egg',
		Head = 'Koenig Schaller',
		Neck = 'Fortitude Torque',
		Ear1 = 'Knight\'s Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Kirin\'s Osode',
		Hands = 'Kng. Handschuhs',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Merman\'s Earring',
		Back = 'Boxer\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dst. Subligar +1',
		Feet = 'Dst. Leggings +1',
	},
    MDT = { -- Shell IV provides 23% MDT
		Ammo = 'Phtm. Tathlum',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring',
		Head = 'Coral Visor +1',
		Neck = 'Harmonia\'s Torque',
        Body = 'Cor. Scale Mail +1',
		Hands = 'Coral Fng. Gnt. +1',
		Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
		Back = 'Resentment Cape',
		Waist = 'Warwolf Belt',
		Legs = 'Coral Cuisses +1',
		Feet = 'Coral Greaves +1',
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
		Ammo = 'Bomb Core',
		Head = 'Panther Mask +1',
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
		Ammo = 'Tiphia Sting',
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
		Ammo = 'Bomb Core',
		Head = 'Panther Mask +1',
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

    Warcry = {
		Head = 'Warrior\'s Mask',
	},
    Provoke = {
		Waist = 'Warwolf Belt',
	},

	Ranged = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Body = 'Scp. Harness +1',
		Hands = 'Seiryu\'s Kote',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Sniper\'s Ring',
		Back = 'Amemet Mantle +1',
		Legs = 'Barone Cosciales',
		Feet = 'Custom F Boots',
	},
	
	['Rampage'] = {
		Head = 'Optical Hat',
		Neck = 'Soil Gorget',
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
		Body = 'Kirin\'s Osode',
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
	
	if (gData.GetPlayer().SubJob == 'SAM') then
        gFunc.Equip('Ear1', 'Attila\'s Earring')
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
    if (player.SubJob == 'SAM' and player.Status ~= 'Idle') then
        gFunc.Equip('Ear1', 'Attila\'s Earring')
    end
    if (gcdisplay.GetToggle('DW') and player.Status == 'Engaged') then
        gFunc.Equip('Ear1', 'Stealth Earring')
    end

    local aggressor = gData.GetBuffCount('Aggressor')
    if (aggressor == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Aggressor)
    end
	if (gcdisplay.IdleSet == 'MDT' and conquest:GetOutsideControl()) then
		gFunc.Equip('Back', 'Resentment Cape')
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
