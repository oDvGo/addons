-- NIN will lose TP on many actions when switching to Staff.
-- Use "/lac disable Main" to prevent weapon swaps if this is not desired.
-- /locktp can be used as well however will lock Range and Ammo slots.

local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local shinobi_ring = true
local shinobi_ring_slot = 'Ring2'

local koga_tekko = false
local koga_tekko_plus_one = false

local uggalepih_pendant = true
local warlocks_mantle = true -- Don't add 2% to fastCastValue to this as it is SJ dependant

local fenrirs_stone = false -- Used for Evasion at night

-- Fill this out for which evasion pants to use at night / dusk to dawn
local night_time_eva_pants = 'Koga Hakama'
local dusk_to_dawn_eva_pants = ''

-- Leave as '' if you do not have the staff.
local fire_staff = 'Vulcan\'s Staff'
local earth_staff = 'Terra\'s Staff'
local water_staff = 'Neptune\'s Staff'
local wind_staff = 'Auster\'s Staff'
local ice_staff = 'Aquilo\'s Staff'
local thunder_staff = 'Jupiter\'s Staff'
local light_staff = 'Apollo\'s Staff'
local dark_staff = 'Pluto\'s Staff'


-- Set to true if you have the obi


local karin_obi = true
local dorin_obi = true
local suirin_obi = true
local furin_obi = true
local hyorin_obi = true
local rairin_obi = true
local korin_obi = true
local anrin_obi = true

local sets = {
    Idle = {
		Range = '',
		Ammo = 'Fenrir\'s Stone',
        Head = 'Optical Hat',
        Neck = 'Evasion Torque',
        Ear1 = 'Drone Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Koga Sarashi',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
		Main = 'Auster\'s Staff',
		Sub = '',
		Range = '',
		Ammo = 'Phtm. Tathlum',
        Head = 'Optical Hat',
        Neck = 'Evasion Torque',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Koga Sarashi',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
	},
    IdleDT = {
        Range = '',
		Ammo = 'Fenrir\'s Stone',
        Head = 'Optical Hat',
        Neck = 'Evasion Torque',
        Ear1 = 'Intruder Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Koga Sarashi',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    IdleALTDT = {},
    Resting = {},
    Town = {
		Main = 'Fudo',
		Sub = 'Yoto +1',
		Range = 'Ungur Boomerang',
		Ammo = '',
        Head = 'Optical Hat',
        Neck = 'Ninjutsu Torque',
		Ear1 = 'Stealth Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Shinobi Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Koga Sarashi',
        Legs = 'Dst. Subligar +1',
        Feet = 'Sarutobi Kyahan',
	},
    Movement = {
		Feet = 'Ninja Kyahan',
	},

    DT = {
		Head = 'Darksteel Cap +1',
		--Neck = 'Fortitude Torque',
		--Ear1 = 'Knight\'s Earring',
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
		--Ammo = 'Phtm. Tathlum',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Cassie Earring',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s Ring',
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
		Head = 'Darksteel Cap +1',
		--Neck = 'Fortitude Torque',
		--Ear1 = 'Knight\'s Earring',
		--Ear2 = 'Cassie Earring',
		Body = 'Dst. Harness +1',
		Hands = 'Dst. Mittens +1',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Boxer\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Yasha Hakama',
		Feet = 'Dst. Leggings +1',
    },
    Haste = { -- Used for Utsusemi cooldown
		Ear1 = 'Shinobi Earring',
		--Head = 'Ninja Hatsubari',
		--Body = 'Custom Vest',
		Waist = 'Koga Sarashi',
		Feet = 'Sarutobi Kyahan',
	},

    Hate = {
        Head = 'Pumpkin Head II',
		Body = 'Nokizaru Gi',
		Legs = 'Nokizaru Hakama',
		Back = 'Resentment Cape',
		Waist = 'Warwolf Belt',
        Ring1 = 'Mermaid Ring',
    },
    NinDebuff = {
		Ammo = 'Phtm. Tathlum',
		Ear1 = 'Ninjutsu Earring',
		Ear2 = 'Stealth Earring',
		Head = 'Ninja Hatsuburi',
		Neck = 'Ninjutsu Torque',
		Body = 'Black Cotehardie',
		Hands = 'Sennight Bangles',
		Legs = 'Yasha Hakama',
		Back = 'Gramary Cape',
		Waist = 'Koga Sarashi',
        Ring1 = 'Mermaid Ring',
		Ring2 = 'Genius Ring',
		Feet = 'Custom F Boots',
	},
    NinElemental = {
		Ammo = 'Phtm. Tathlum',
		Ear1 = 'Stealth Earring',
		Ear2 = 'Moldavite Earring',
		Head = 'Ninja Hatsuburi',
		Neck = 'Ninjutsu Torque',
		Body = 'Black Cotehardie',
		Hands = 'Sennight Bangles',
		Legs = 'Yasha Hakama',
		Back = 'Gramary Cape',
		Waist = 'Koga Sarashi',
        Ring1 = 'Genius Ring',
		Ring2 = 'Genius Ring',
		Feet = 'Custom F Boots',
	},
    NinElemental_Accuracy = {
		Ammo = 'Phtm. Tathlum',
		Ear1 = 'Ninjutsu Earring',
		Ear2 = 'Stealth Earring',
		Head = 'Ninja Hatsuburi',
		Neck = 'Ninjutsu Torque',
		Body = 'Black Cotehardie',
		Hands = 'Sennight Bangles',
		Legs = 'Yasha Hakama',
		Back = 'Gramary Cape',
		Waist = 'Koga Sarashi',
        Ring1 = 'Genius Ring',
		Ring2 = 'Genius Ring',
		Feet = 'Custom F Boots',
	},
    DrkDarkMagic = {
		Neck = 'Dark Torque',
	},

    Enhancing = {
		Neck = 'Enhancing Torque',
	},
    Cure = {
		Neck = 'Healing Torque',
	},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        Range = '',
		Ammo = 'Bomb Core',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Ninja Chainmail',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Koga Hakama',
        Feet = 'Sarutobi Kyahan',
    },
    TP_HighAcc = {
		Range = '',
		Ammo = 'Tiphia Sting',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Optical Earring',
        Ear2 = 'Stealth Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Koga Hakama',
        Feet = 'Sarutobi Kyahan',
	},
    TP_Mjollnir_Haste = {},

    WS = {
		Ammo = 'Bomb Core',
        Head = 'Emperor Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Haubergeon',
        Hands = 'Ochiudo\'s Kote',
        Ring1 = 'Victory Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Ryl.Kgt. Breeches',
        Feet = 'Bounding Boots',
	},
    WS_HighAcc = {},

    WS_BladeJin = {
		Ear1 = 'Minuet Earring',
	},
    WS_BladeKu = {},

    Ranged = {
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'War Shinobi Gi',
        Hands = 'Ninja Tekko',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Ryl.Kgt. Belt',
        Legs = 'Ninja Hakama',
        Feet = 'Custom F Boots',
	}, -- This won't work for automatically swapping shurikens, only other equipment
	
	Charm = {
		Head = 'Ninja Hatsuburi',
		Body = 'Custom Vest',
		Legs = 'Custom Pants',
		Waist = 'Ryl.Kgt. Belt',
		Back = 'Gramary Cape',
	},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
	--AshitaCore:GetChatManager():QueueCommand(1, '/lac disable back')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local NinDebuffs = T{ 'Kurayami: Ni', 'Hojo: Ni', 'Jubaku: Ichi', 'Dokumori: Ichi', 'Kurayami: Ichi', 'Hojo: Ichi' }
local DrkDebuffs = T{ 'Bind', 'Sleep', 'Poison' }
local DrkDarkMagic = T{ 'Stun', 'Aspir', 'Drain', 'Absorb-AGI', 'Absorb-VIT' }
local NinElemental = T{
    'Hyoton: Ni', 'Katon: Ni', 'Huton: Ni', 'Doton: Ni', 'Raiton: Ni', 'Suiton: Ni',
    'Hyoton: Ichi', 'Katon: Ichi', 'Huton: Ichi', 'Doton: Ichi', 'Raiton: Ichi', 'Suiton: Ichi',
    'Hyoton: San', 'Katon: San', 'Huton: San', 'Doton: San', 'Raiton: San', 'Suiton: San'
}

local ElementalStaffTable = {
    ['Fire'] = fire_staff,
    ['Earth'] = earth_staff,
    ['Water'] = water_staff,
    ['Wind'] = wind_staff,
    ['Ice'] = ice_staff,
    ['Thunder'] = thunder_staff,
    ['Light'] = light_staff,
    ['Dark'] = dark_staff
}

local NukeObiTable = {
    ['Fire'] = 'Karin Obi',
    ['Earth'] = 'Dorin Obi',
    ['Water'] = 'Suirin Obi',
    ['Wind'] = 'Furin Obi',
    ['Ice'] = 'Hyorin Obi',
    ['Thunder'] = 'Rairin Obi',
    ['Light'] = 'Korin Obi',
    ['Dark'] = 'Anrin obi'
}

local NukeObiOwnedTable = {
    ['Fire'] = karin_obi,
    ['Earth'] = dorin_obi,
    ['Water'] = suirin_obi,
    ['Wind'] = furin_obi,
    ['Ice'] = hyorin_obi,
    ['Thunder'] = rairin_obi,
    ['Light'] = korin_obi,
    ['Dark'] = anrin_obi
}

local WeakElementTable = {
    ['Fire'] = 'Water',
    ['Earth'] = 'Wind',
    ['Water'] = 'Thunder',
    ['Wind'] = 'Ice',
    ['Ice'] = 'Fire',
    ['Thunder'] = 'Earth',
    ['Light'] = 'Dark',
    ['Dark'] = 'Light'
}

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    gFunc.EquipSet(sets.Hate)
	if (gData.GetAction().Name == 'Charm') then
        gFunc.EquipSet(sets.Charm)
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
    if (action.Name == 'Blade: Jin') then
        gFunc.EquipSet(sets.WS_BladeJin)
    elseif (action.Name == 'Blade: Ku') then
        gFunc.EquipSet(sets.WS_BladeKu)
    end

    local environment = gData.GetEnvironment()
    if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
        gFunc.Equip('Hands', 'Koga Tekko')
    end
    if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
        gFunc.Equip('Hands', 'Kog. Tekko +1')
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'nuke'})
	gcinclude.SetAlias(T{'staff'})
    gcdisplay.CreateCycle('Nuke', {[1] = 'Potency', [2] = 'Accuracy',})
    gcdisplay.CreateToggle('Staff', false)
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'nuke'})
	gcinclude.ClearAlias(T{'staff'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'nuke') then
        gcdisplay.AdvanceCycle('Nuke')
        gcinclude.Message('Nuke', gcdisplay.GetCycle('Nuke'))
    elseif (args[1] == 'staff') then
        gcdisplay.AdvanceToggle('Staff')
		gcinclude.Message('Staff', gcdisplay.GetToggle('Staff'))
	else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()
	
	if (gData.GetBuffCount('Minuet') > 0 and gData.GetPlayer().Status ~= 'Idle') then
		gFunc.Equip('Ear1', 'Minuet Earring');
    end
	
    local player = gData.GetPlayer()
    local environment = gData.GetEnvironment()

    if (player.Status == 'Engaged') then
        if (shinobi_ring and player.HPP <= 75 and player.TP <= 1000) then
            gFunc.Equip(shinobi_ring_slot, 'Shinobi Ring')
        end
        if (koga_tekko and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Hands', 'Koga Tekko')
        end
        if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip('Hands', 'Kog. Tekko +1')
        end
    end

    gcmelee.DoDefaultOverride()

	if (gcdisplay.IdleSet == 'Evasion' or player.Status == 'Idle') then


        if (fenrirs_stone and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Ammo', 'Fenrir\'s Stone')
        end
    end
    if (gcdisplay.IdleSet == 'Evasion' or player.Status == 'Idle') then
        if (night_time_eva_pants ~= '' and (environment.Time < 6 or environment.Time >= 18)) then
            gFunc.Equip('Legs', night_time_eva_pants)
        end
        if (dusk_to_dawn_eva_pants ~= '' and (environment.Time < 7 or environment.Time >= 17)) then
            gFunc.Equip('Legs', dusk_to_dawn_eva_pants)
        end
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
	if (player.Status == 'Idle' and player.HPP < 75) then
        if (conquest:GetOutsideControl()) then
			gFunc.Equip('Head', 'President. Hairpin')
		end
		gFunc.Equip('Body', 'War Shinobi Gi')
    end
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
    local environment = gData.GetEnvironment()

    if (shinobi_ring and player.HPP <= 75 and player.TP <= 1000) then
        gFunc.Equip(shinobi_ring_slot, 'Shinobi Ring')
    end
    if (koga_tekko_plus_one and (environment.Time < 7 or environment.Time >= 17)) then
        gFunc.Equip('Hands', 'Kog. Tekko +1') -- You can comment this out if you have Dusk Gloves +1 and would prefer +22 HP over Ninja Tool Expertise.
    end

    local action = gData.GetAction()
    if (action.Skill == 'Ninjutsu') then
        if (NinDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.NinDebuff)
            EquipStaffAndObi(action)
        elseif (NinElemental:contains(action.Name)) then
            gFunc.EquipSet(sets.NinElemental)
            if (gcdisplay.GetCycle('Nuke') == 'Accuracy') then
                gFunc.EquipSet(sets.NinElemental_Accuracy)
            end
            if (action.MppAftercast < 51) and uggalepih_pendant then
                gFunc.Equip('Neck', 'Uggalepih Pendant')
            end
            EquipStaffAndObi(action)
        end
    elseif (action.Skill == 'Enfeebling Magic') then
        if (DrkDebuffs:contains(action.Name)) then
            gFunc.EquipSet(sets.Hate)
        end
        local staff = ElementalStaffTable[action.Element]
        if (staff ~= '' and gcdisplay.GetToggle('Staff')) then
            gFunc.Equip('Main', staff)
        end
    elseif (action.Skill == 'Dark Magic') then
        if (DrkDarkMagic:contains(action.Name)) then
            gFunc.EquipSet(sets.DrkDarkMagic)
        end
        EquipStaffAndObi(action)
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing)
    elseif (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure)
    end
end

function EquipStaffAndObi(action)
    local staff = ElementalStaffTable[action.Element]
    
    local staff = ElementalStaffTable[action.Element]
    if (gcdisplay.GetToggle('Staff')) then
        if staff ~= '' then
			gFunc.Equip('Main', staff)
		end
    end
    

    if (ObiCheck(action)) then
        local obi = NukeObiTable[action.Element]
        local obiOwned = NukeObiOwnedTable[action.Element]
        if (obiOwned) then
            gFunc.Equip('Waist', obi)
        end
    end
end

function ObiCheck(action)
    local element = action.Element
    local environment = gData.GetEnvironment()
    local weakElement = WeakElementTable[element]

    if environment.WeatherElement == element then
        return environment.Weather:match('x2') or environment.DayElement ~= weakElement
    end

    return environment.DayElement == element and environment.WeatherElement ~= weakElement
end

return profile
