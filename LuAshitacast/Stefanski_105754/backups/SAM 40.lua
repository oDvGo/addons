local profile = {}

local fastCastValue = 0.00 -- 0% from gear

-- Replace these with '' if you do not have them
local myochin_kabuto = ''
local saotome_kote = ''

local sets = {
    Idle = {
		Range = 'Great Bow +1',
		Ammo = 'Scorpion Arrow',
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Custom Vest',
		Hands = 'Custom F Gloves',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		--Back = '',
		Waist = 'Tilt Belt',
		Legs = 'Jujitsu Sitabaki',
		Feet = 'Sarutobi Kyahan',
	},
    IdleALT = {
		Range = '',
		Ammo = 'Mille. Sachet',
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Custom Vest',
		Hands = 'Custom F Gloves',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		--Back = '',
		Waist = 'Tilt Belt',
		Legs = 'Jujitsu Sitabaki',
		Feet = 'Bounding Boots',
	},
    Resting = {},
    Town = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Drone Earring',
		Body = 'Custom Vest',
		Hands = 'Custom F Gloves',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		--Back = '',
		Waist = 'Tilt Belt',
		Legs = 'Jujitsu Sitabaki',
		Feet = 'Sarutobi Kyahan',
	},
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
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Optical Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Custom Vest',
		Hands = 'Custom F Gloves',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		--Back = '',
		Waist = 'Tilt Belt',
		Legs = 'Jujitsu Sitabaki',
		Feet = 'Sarutobi Kyahan',
	},
    TP_HighAcc = {},
    TP_Mjollnir_Haste = {},

    WS = {},
    WS_HighAcc = {},

    WS_Kaiten = {},
	
	Ranged = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Body = 'Custom Vest',
		Hands = 'Custom F Gloves',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Rajas Ring',
		--Back = '',
		Waist = 'Tilt Belt',
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
