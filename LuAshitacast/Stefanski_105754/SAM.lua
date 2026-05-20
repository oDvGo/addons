local profile = {}

local fastCastValue = 0.02 -- 0% from gear

-- Replace these with '' if you do not have them
local myochin_kabuto = 'Myochin Kabuto'
local saotome_kote = 'Saotome Kote'

local sets = {
    Idle = {
		Range = '',
		Ammo = 'Fenrir\'s Stone',
		Head = 'Darksteel Cap +1',
		Neck = 'Fortitude Torque',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Kirin\'s Osode',
		Hands = 'Dst. Mittens +1',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Boxer\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Dst. Subligar +1',
        Feet = 'Suzaku\'s Sune-Ate',
	},
    IdleALT = {
		Range = 'Expunger',
		Ammo = 'Scorpion Arrow',
		Head = 'Myochin Kabuto',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Haubergeon',
		Hands = 'Pallas\'s Bracelets',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Boxer\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Luisant Brayettes',
        Feet = 'Sarutobi Kyahan',
	},
    Resting = {
		Ear1 = 'Sanative Earring',
	},
    Town = {
		Main = 'Soboro Sukehiro',
		Sub = '',
		Range = '',
		Ammo = 'Fenrir\'s Stone',
		Head = 'Saotome Kabuto',
		Neck = 'Aqua Gorget',
		Ear1 = 'Fenrir\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Kirin\'s Osode',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Byakko\'s Haidate',
        Feet = 'Sarutobi Kyahan',
	},
    Movement = {
		Hands = 'Ochiudo\'s Kote',
	},

    DT = {
		Head = 'Darksteel Cap +1',
		Neck = 'Fortitude Torque',
		Ear1 = 'Knight\'s Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Dst. Harness +1',
		Hands = 'Dst. Mittens +1',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Merman\'s Ring',
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
		Ear1 = 'Loquac. Earring',
	},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
		Waist = 'Swift Belt',
		Feet = 'Sarutobi Kyahan',
	},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Ammo = 'Tiphia Sting',
		Head = 'Saotome Kabuto',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Haubergeon',
		Hands = 'Dusk Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Swift Belt',
		Legs = 'Byakko\'s Haidate',
        Feet = 'Sarutobi Kyahan',
	},
    TP_HighAcc = {
		Ammo = 'Tiphia Sting',
		Head = 'Saotome Kabuto',
		Neck = 'Peacock Amulet',
		Ear1 = 'Diabolos\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Dusk Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Swift Belt',
		Legs = 'Byakko\'s Haidate',
        Feet = 'Sarutobi Kyahan',
	},
    TP_Mjollnir_Haste = {},

    WS = {
		Head = 'Hachiman Jinpachi',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Hachiman Domaru',
		Hands = 'Pallas\'s Bracelets',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Shura Haidate',
        Feet = 'Hmn. Sune-Ate',
	},
    WS_HighAcc = {
		Head = 'Hachiman Jinpachi',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Hachiman Domaru',
		Hands = 'Pallas\'s Bracelets',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Shura Haidate',
        Feet = 'Hmn. Sune-Ate',
	},

    WS_Kaiten = {},
	
	WS_Gekko = {
		Neck = 'Aqua Gorget',
	},
	
	WS_Jinpu = {
		Head = 'Hachiman Jinpachi',
		Neck = 'Peacock Amulet',
		Ear1 = 'Moldavite Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Hachiman Domaru',
		Hands = 'Pallas\'s Bracelets',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Shura Haidate',
        Feet = 'Hmn. Sune-Ate',
	},
	
	Ranged = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Body = 'Custom Vest',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Sao. Koshi-Ate',
		Legs = 'Ryl.Kgt. Breeches',
		Feet = 'Custom F Boots',
	},
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

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Meditate') then
        if (myochin_kabuto ~= '') then
            gFunc.Equip('Head', myochin_kabuto)
        end
        if (saotome_kote ~= '') then
            gFunc.Equip('Hands', saotome_kote)
        end
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
    if (action.Name == 'Tachi: Kaiten') then
        gFunc.EquipSet(sets.WS_Kaiten)
    end
	if (action.Name == 'Tachi: Gekko') then
        gFunc.EquipSet(sets.WS_Gekko)
    end
	if (action.Name == 'Tachi: Jinpu') then
        gFunc.EquipSet(sets.WS_Jinpu)
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
	
	if (gData.GetBuffCount('Minuet') > 0 and gData.GetPlayer().Status ~= 'Idle') then
		gFunc.Equip('Ear1', 'Minuet Earring');
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
