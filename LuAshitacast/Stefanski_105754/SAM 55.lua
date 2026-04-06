local profile = {}

local fastCastValue = 0.00 -- 0% from gear

-- Replace these with '' if you do not have them
local myochin_kabuto = 'Myochin Kabuto'
local saotome_kote = ''

local sets = {
    Idle = {
		Range = '',
		Ammo = 'Mille. Sachet',
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Luisant Haubert',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Agile Mantle',
		Waist = 'Swordbelt +1',
		Legs = 'Luisant Brayettes',
        Feet = 'Sarutobi Kyahan',
	},
    IdleALT = {
		Range = 'Great Bow +1',
		Ammo = 'Scorpion Arrow',
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Luisant Haubert',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Agile Mantle',
		Waist = 'Swordbelt +1',
		Legs = 'Luisant Brayettes',
        Feet = 'Sarutobi Kyahan',
	},
    Resting = {
		Ear1 = 'Sanative Earring',
	},
    Town = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Drone Earring',
		Body = 'Luisant Haubert',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Resentment Cape',
		Waist = 'Swordbelt +1',
		Legs = 'Luisant Brayettes',
        Feet = 'Sarutobi Kyahan',
	},
    Movement = {},

    DT = {
		Head = 'Darksteel Cap +1',
		Body = 'Dst. Harness +1',
		Hands = 'Dst. Mittens +1',
		Ring1 = 'Jelly Ring',
		Legs = 'Dst. Subligar +1',
		Feet = 'Dst. Leggings +1',
	},
    MDT = { -- Shell IV provides 23% MDT
		Back = 'Resentment Cape',
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
		Feet = 'Sarutobi Kyahan',
	},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Luisant Haubert',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Agile Mantle',
		Waist = 'Swift Belt',
		Legs = 'Luisant Brayettes',
        Feet = 'Sarutobi Kyahan',
	},
    TP_HighAcc = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Luisant Haubert',
		Hands = 'Luisant Moufles',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Agile Mantle',
		Waist = 'Swift Belt',
		Legs = 'Luisant Brayettes',
        Feet = 'Sarutobi Kyahan',
	},
    TP_Mjollnir_Haste = {},

    WS = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Luisant Haubert',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Victory Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Ryl. Army Mantle',
		Waist = 'Swordbelt +1',
		Legs = 'Luisant Brayettes',
        Feet = 'Luisant Sollerets',
	},
    WS_HighAcc = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Luisant Haubert',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Victory Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Ryl. Army Mantle',
		Waist = 'Life Belt',
		Legs = 'Luisant Brayettes',
        Feet = 'Luisant Sollerets',
	},

    WS_Kaiten = {},
	
	WS_Jinpu = {
		Head = 'Luisant Salade',
		Neck = 'Peacock Amulet',
		Ear1 = 'Moldavite Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Luisant Haubert',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Victory Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Ryl. Army Mantle',
		Waist = 'Swordbelt +1',
		Legs = 'Luisant Brayettes',
        Feet = 'Custom F Boots',
	},
	
	Ranged = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Body = 'Custom Vest',
		Hands = 'Ochiudo\'s Kote',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Agile Mantle',
		Waist = 'Swordbelt +1',
		Legs = 'Jujitsu Sitabaki',
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
