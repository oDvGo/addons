local profile = {}

local fastCastValue = 0.04 -- 0% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.

local ninSJMaxMP = 919 -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = 978 -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = 1016 -- The Max MP you have when /blm in your idle set

local virology_ring = false
local virology_ring_slot = 'Ring2'

local displayheadOnAbility = false

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Cleric\'s Cap',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Cleric\'s Bliaut',
        Hands = 'Cleric\'s Mitts',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Back = 'Cheviot Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Cleric\'s Pantaln.',
        Feet = 'Rostrum Pumps',
    },
    IdleALT = {},
    IdleMaxMP = {
		Main = 'Terra\'s Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Cleric\'s Cap',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet',
        Hands = 'Cleric\'s Mitts',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Back = 'Cheviot Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Healer\'s Pantaln.',
        Feet = 'Rostrum Pumps',
	},
    Resting = {
        Main = 'Pluto\'s Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Hydra Beret',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Hands = 'Cleric\'s Mitts',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Back = 'Merciful Cape',
        Waist = 'Cleric\'s Belt',
        Legs = 'Hydra Brais',
        Feet = 'Rostrum Pumps',
    },
    Town = {},
    Movement = {},

    DT = {
		Main = 'Terra\'s Staff',
		Sub = '',
		Range = '',
		Ammo = 'Fortune Egg',
		Head = 'Cleric\'s Cap',
		Neck = 'Fortitude Torque',
		Ear1 = 'Knight\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Cleric\'s Bliaut',
		Hands = 'Garden Bangles',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Cheviot Cape',
		Waist = 'Hierarch Belt',
		Legs = 'Blessed Trousers',
		Feet = 'Rostrum Pumps',
	},
    DTNight = {
		Main = 'Terra\'s Staff',
		Sub = '',
		Range = '',
		Ammo = 'Fortune Egg',
		Head = 'Cleric\'s Cap',
		Neck = 'Fortitude Torque',
		Ear1 = 'Knight\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Cleric\'s Bliaut',
		Hands = 'Garden Bangles',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Cheviot Cape',
		Waist = 'Hierarch Belt',
		Legs = 'Blessed Trousers',
		Feet = 'Rostrum Pumps',
	},
    MDT = { -- Shell IV provides 23% MDT
		Main = 'Kirin\'s Pole',
		Sub = '',
		Range = '',
		Ammo = 'Phtm. Tathlum',
		Head = 'Cleric\'s Cap',
		Neck = 'Checkered Scarf',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Cleric\'s Bliaut',
		Hands = 'Merman\'s Bangles',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Cheviot Cape',
		Waist = 'Penitent\'s Rope',
		Legs = 'Mahatma Slops',
		Feet = 'Rostrum Pumps',
	},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {
		Feet = 'Rostrum Pumps',
		Ear1 = 'Loquac. Earring',
		Back = 'Warlock\'s Mantle',
	},
    Casting = { -- Default Casting Equipment when using Idle sets
		Main = 'Eremite\'s Wand',
		Sub = 'Strike Shield',
		Head = 'Nashira turban',
		Feet = 'Healer\'s Duckbills',
		Back = 'Cheviot Cape',
    },
    SIRD = {
        -- Main = 'Light Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Cleric\'s Cap',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Cleric\'s Bliaut',
        Hands = 'Blessed Mitts',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Back = 'Merciful Cape',
        Waist = 'Cleric\'s Belt',
        Legs = 'Blessed Trousers',
        Feet = 'Healer\'s Duckbills',
    },
    Haste = {
        --Main = 'Light Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Cleric\'s Cap',
        Neck = 'Enhancing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Nashira Manteel',
        Hands = 'Blessed Mitts',
        Ring1 = 'Serket Ring',
        Ring2 = 'Ether Ring',
        Back = 'Rainbow Cape',
        Waist = 'Swift Belt',
        Legs = 'Blessed Trousers',
        Feet = 'Healer\'s Duckbills',
    },
    ConserveMP = {},

    Yellow = {
		Ammo = 'Tiphia Sting',
		Head = 'Zenith Crown',
		Hands = 'Zenith Mitts',
		Ring1 = 'ASerket Ring',
		Waist = 'Penitent\'s Rope',
		Legs = 'Zenith Slacks',
		Feet = 'Rostrum Pumps',
		
	},
    Cure = {
        --Main = 'Rucke\'s Rung',
        Range = '',
        Ammo = 'Hedgehog Bomb', --1
        Head = 'Hydra Beret', --8
        Neck = 'Healing Torque',
        Ear1 = 'Novia Earring', --7
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet',--9
        Hands = 'Nashira Gages',--4
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',--3
        Legs = 'Hydra Brais', --6
        Feet = 'Cleric\'s Duckbills', --1
    },
    Cure5 = {
        --Main = 'Rucke\'s Rung',
        Range = '',
        Ammo = 'Hedgehog Bomb', --1
        Head = 'Hydra Beret', --8
        Neck = 'Healing Torque',
        Ear1 = 'Novia Earring', --7
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet',--9
        Hands = 'Nashira Gages',--4
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',--3
        Legs = 'Hydra Brais', --6
        Feet = 'Cleric\'s Duckbills', --1
    },
    Regen = {
        Main = 'Rucke\'s Rung',
		Neck = 'Enhancing Torque',
		Body = 'Cleric\'s Bliaut',
    },
    Barspell = {
		Neck = 'Enhancing Torque',
		Legs = 'Cleric\'s Pantaln.',
		Feet = 'Cleric\'s Duckbills',
		Back = 'Merciful Cape',
	},
    Cursna = {},

    Enhancing = {
		Neck = 'Enhancing Torque',
		Back = 'Merciful Cape',
		Feet = 'Cleric\'s Duckbills',
	},
    Stoneskin = {
		Main = 'Kirin\'s Pole',
		Sub = '',
		Range = '',
		Ammo = '',
		Neck = 'Enhancing Torque',
		Ear1 = 'Loquac. Earring',
		Head = 'Healer\'s Cap',
		Body = 'Errant Hpl.',
		Hands = 'Blessed Mitts',
		Ring1 = 'Aqua Ring',
		Ring2 = 'Aqua Ring',
		Legs = 'Mahatma Slops',
		Waist = 'Cleric\'s Belt',
		Feet = 'Cleric\'s Duckbills',
		Back = 'Merciful Cape',
	},
    Spikes = {},

    Enfeebling = {
        --Main = 'Light Staff',
        Range = '',
        Ammo = 'Phtm. Tathlum',
        Head = 'Healer\'s Cap',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Hlr. Bliaut +1',
        Hands = 'Cleric\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Snow Ring',
        Back = 'Altruistic Cape',
        Waist = 'Cleric\'s Belt',
        Legs = 'Nashira Seraweels',
        --Feet = 'Healer\'s Duckbills',
    },
    EnfeeblingMND = {
        --Main = 'Light Staff',
        Range = '',
        Ammo = 'Phtm. Tathlum',
        Head = 'Healer\'s Cap',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Hlr. Bliaut +1',
        Hands = 'Cleric\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Altruistic Cape',
        Waist = 'Cleric\'s Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Cleric\'s Duckbills',
    },
    EnfeeblingINT = {
        --Main = 'Light Staff',
        Range = '',
        Ammo = 'Phtm. Tathlum',
        Head = 'Healer\'s Cap',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Hlr. Bliaut +1',
        Hands = 'Cleric\'s Mitts',
        Ring1 = 'Zircon Ring',
        Ring2 = 'Snow Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Nashira Seraweels',
        Feet = 'Healer\'s Duckbills',
    },
    EnfeeblingACC = {
		Range = '',
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Nashira Manteel',
        Hands = 'Cleric\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Snow Ring',
        Back = 'Altruistic Cape',
        Waist = 'Cleric\'s Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Healer\'s Duckbills',
	},

    Divine = {
        --Main = 'Light Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Healer\'s Cap',
        Neck = 'Divine Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Errant Hpl.',
        Hands = 'Seer\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Altruistic Cape',
        Waist = 'Cleric\'s Belt',
        Legs = 'Healer\'s Pantaln.',
        Feet = 'Healer\'s Duckbills',
    },
    Banish = {
        --Main = 'Light Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Healer\'s Cap',
        Neck = 'Divine Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Errant Hpl.',
        Hands = 'Cleric\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Altruistic Cape',
        Waist = 'Cleric\'s Belt',
        Legs = 'Healer\'s Pantaln.',
        Feet = 'Healer\'s Duckbills',
    },
    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Nashira Manteel',
        Hands = 'Blessed Mitts',
        Ring1 = 'Snow Ring',
        Ring2 = 'Snow Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Blessed Pumps',
    },

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP = {
		Main = 'Prudence Rod',
		Sub = 'Strike Shield',
		Range = '',
		Ammo = 'Virtue Stone',
		Ear1 = 'Brutal earring',
		Ear2 = 'Knight\'s Earring',
		Neck = 'Peacock Amulet',
		Head = 'Optical Hat',
        Hands = 'Blessed Mitts',
		Body = 'Hydra Doublet',
		Legs = 'Hydra Brais',
		Feet = 'Blessed Pumps',
		Waist = 'Swift Belt',
		Back = 'Ryl. Army Mantle',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
	},
    TP_HighAcc = {
		Main = 'Prudence Rod',
		Sub = 'Strike Shield',
		Range = '',
		Ammo = 'Virtue Stone',
		Ear1 = 'Brutal Earring',
		Ear2 = 'Knight\'s Earring',
		Neck = 'Peacock Amulet',
		Head = 'Optical Hat',
        Hands = 'Blessed Mitts',
		Body = 'Hydra Doublet',
		Legs = 'Hydra Brais',
		Feet = 'Marine F Boots',
		Waist = 'Life Belt',
		Back = 'Ryl. Army Mantle',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
	},
    TP_NIN = {
		Main = 'Morgenstern',
		Sub = 'Prudence Rod',
		Range = '',
		Ammo = 'Virtue Stone',
		--Ear1 = 'Stealth Earring',
		Ear2 = 'Knight\'s Earring',
		Neck = 'Peacock Amulet',
		Head = 'Optical Hat',
        Hands = 'Blessed Mitts',
		Body = 'Nashira Manteel',
		Legs = 'Blessed Trousers',
		Feet = 'Blessed Pumps',
		Waist = 'Swift Belt',
		Back = 'Ryl. Army Mantle',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
	},
    TP_Mjollnir_Haste = {
		Ammo = 'Tiphia Sting',
		Ear1 = 'Brutal earring',
		Ear2 = 'Knight\'s Earring',
		Neck = 'Peacock Amulet',
		Head = 'Optical Hat',
        Hands = 'Blessed Mitts',
		Body = 'Hydra Doublet',
		Legs = 'Hydra Brais',
		Feet = 'Blessed Pumps',
		Waist = 'Swift Belt',
		Back = 'Ryl. Army Mantle',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
	},
    WS = {
		Ammo = 'Tiphia Sting',
		Ear1 = 'Brutal Earring',
		Ear2 = 'Knight\'s Earring',
		Neck = 'Light Gorget',
		Head = 'Optical Hat',
        Hands = 'Hlr. Mitts +1',
		Body = 'Hydra Doublet',
		Legs = 'Hydra Brais',
		Feet = 'Cleric\'s Duckbills',
		Waist = 'Life Belt',
		Back = 'Ryl. Army Mantle',
		Ring1 = 'Aqua Ring',
		Ring2 = 'Rajas Ring',
	},
    WS_HighAcc = {
		Ammo = 'Tiphia Sting',
		Ear1 = 'Brutal Earring',
		Ear2 = 'Knight\'s Earring',
		Neck = 'Light Gorget',
		Head = 'Optical Hat',
        Hands = 'Hlr. Mitts +1',
		Body = 'Hydra Doublet',
		Legs = 'Hydra Brais',
		Feet = 'Cleric\'s Duckbills',
		Waist = 'Life Belt',
		Back = 'Ryl. Army Mantle',
		Ring1 = 'Aqua Ring',
		Ring2 = 'Toreador\'s Ring',
	},
    WS_Randgrith = {},
    
	Jump = {
        --Main = 'Jupiter\'s Staff',
        Ammo = 'Tiphia Sting',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Optical Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Hydra Doublet',
        Hands = 'Battle Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Wyvern Mantle',
        Waist = 'Hierarch Belt',
        Legs = 'Hydra Brais',
        Feet = 'Marine F Boots',
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

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    if (displayheadOnAbility) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/displayhead')
    end
	if ((gData.GetAction().Name == 'Jump') or (gData.GetAction().Name == 'High Jump')) then
		gFunc.EquipSet('Jump')
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
    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end

    local action = gData.GetAction()
    if (action.Name == 'Randgrith') then
        gFunc.EquipSet(sets.WS_Randgrith)
    end

    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    local player = gData.GetPlayer()
	
	local environment = gData.GetEnvironment()
	
	
	gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
	if (player.SubJob == 'NIN' and player.Status == 'Engaged') then
        gFunc.Equip('Ear1', 'Stealth Earring')
    end
	if (player.Status == 'Idle' and player.HPP < 95 and conquest:GetOutsideControl()) then
        gFunc.Equip('Head', 'President. Hairpin')
    end
	if ((player.Status == 'Idle' or player.Status == 'Resting')) then
		if (environment.Time >= 6 and environment.Time < 18) then
			gFunc.Equip('Hands', 'Garden Bangles')
		end
    end
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

    local action = gData.GetAction()
    if (action.Skill == 'Enhancing Magic') then
        if (string.match(action.Name, 'Regen')) then
            gFunc.EquipSet('Regen')
        elseif (string.match(action.Name, 'Bar')) then
            gFunc.EquipSet('Barspell')
        end
    elseif (string.match(action.Name, 'Banish')) then
        gFunc.EquipSet('Banish')
    elseif virology_ring and (string.match(action.Name, '.*na$') or (action.Name == 'Erase')) then
        gFunc.Equip(virology_ring_slot, 'Virology Ring')
    end
end

return profile
