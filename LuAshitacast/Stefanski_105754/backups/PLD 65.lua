local profile = {}

local fastCastValue = 0 -- 7% from gear

local parade_gorget = true

local hercules_ring = false
local hercules_ring_slot = 'Ring1'

-- Replace these with '' if you do not have them
local gallant_leggings = 'Gallant Leggings'
local valor_leggings = ''

local arco_de_velocidad = false

local warlocks_mantle = true -- Don't add 2% to fastCastValue to this as it is SJ dependant

local shadow_mantle = false

local sets = {
    Idle = { -- 1415
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        Ammo = 'Happy Egg',
        Head = 'Gallant Coronet',
        Body = 'Gallant Surcoat',
        Neck = 'Shield Torque',
        Ear1 = 'Buckler Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Gallant Gauntlets',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Resentment Cape',
        Waist = 'Astral Rope',
        Legs = 'Gallant Breeches',
        Feet = 'Gallant Leggings',
    },
    IdleALT = {
		Main = 'Terra\'s Staff',
        Sub = '',
        --Range = '',
        Ammo = 'Happy Egg',
        Head = 'Gallant Coronet',
        Body = 'Gallant Surcoat',
        Neck = 'Shield Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Gallant Gauntlets',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Resentment Cape',
        Waist = 'Astral Rope',
        Legs = 'Gallant Breeches',
        Feet = 'Gallant Leggings',
    },
    IdleDT = { -- 1415
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        Ammo = 'Happy Egg',
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = 'Shield Torque',
        Ear1 = 'Buckler Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Dst. Mittens +1', -- 3
        Ring1 = 'Jelly Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Resentment Cape',
        Waist = 'Astral Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Gallant Leggings',
    },
    IdleALTDT = {
		Main = 'Terra\'s Staff',
        Sub = '',
        --Range = '',
        Ammo = 'Happy Egg',
        Head = 'Gallant Coronet',
        Body = 'Gallant Surcoat',
        Neck = 'Shield Torque',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Gallant Gauntlets',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Resentment Cape',
        Waist = 'Astral Rope',
        Legs = 'Gallant Breeches',
        Feet = 'Gallant Leggings',
    },
    Resting = {
        --Main = 'Pluto\'s Staff',
        --Sub = 'remove',
		Neck = 'Parade Gorget',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Sanative Earring',
    },
    Town = {
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        --Ammo = '',
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Neck = 'Parade Gorget',
        Ear1 = 'Buckler Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Resentment Cape',
        Waist = 'Astral Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Gallant Leggings',
    },
    Movement = {
        Legs = 'Crimson Cuisses',
    },

    DT = { -- 1415
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = 'Rosenbogen',
        --Ammo = '',
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = 'Shield Torque',
        Ear1 = 'Buckler Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Dst. Mittens +1', -- 3
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = 'Mermaid Ring',
        --Back = 'Shadow Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Gallant Leggings',
    },
    MDT = { -- Shell IV provides 23% MDT
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Cassie Earring',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
    },
    FireRes = { -- 137
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Dino Mantle', -- 4
        Waist = 'Water Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = { -- 135
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Ram Mantle +1', -- 6
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Blood Greaves', -- 21
    },
    LightningRes = { -- 138
        Sub = 'Nms. Shield +1', -- 15
        Range = 'Lightning Bow +1', -- 7
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Heavy Gauntlets',
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Gaia Mantle +1', -- 12
        Waist = 'Earth Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Dst. Leggings +1',
    },
    EarthRes = { -- 143
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Gaia Mantle +1', -- 10
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Blood Greaves', -- 21
    },
    WindRes = { -- 118
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Ice Belt', -- 20
        Legs = 'Coral Cuisses +1',
        Feet = 'Blood Greaves', -- 21
    },
    WaterRes = { -- 128
        Range = 'Rosenbogen',
        Ammo = '',
        Head = 'Black Ribbon', -- 12
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Assault Brstplate', -- 15
        Hands = 'Coral Fng. Gnt. +1', -- 4
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = { Name = 'Valor Cape', Priority = 100 },
        Waist = 'Lightning Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Coral Greaves +1', -- 4
    },
    Evasion = {
        Head = 'Bahamut\'s Mask',
        -- Hrotti
        -- Crimson Scale Mail
        Legs = 'Bahamut\'s Hose',
        Ring2 = 'Sattva Ring',
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
        Legs = 'Homam Cosciales',
    },
    SIRD = { -- 1441
        Ammo = 'Happy Egg',
        Head = 'Darksteel Cap +1', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = 'Shield Torque',
        Ear1 = 'Buckler Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Dst. Mittens +1', -- 3
        Ring1 = 'Jelly Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Resentment Cape',
        Waist = 'Astral Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Gallant Leggings',
    },
    Haste = { -- 1416
        --Main = { Name = 'Capricorn Staff', Priority = -1 }, -- 5
        --Sub = 'remove',
        Head = 'Homam Zucchetto',
        Neck = 'Willpower Torque',
        Ear1 = 'Loquac. Earring', -- FC
        Ear2 = 'Magnetic Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Dusk Gloves +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Shadow Mantle',
        Waist = 'Sonic Belt', -- 6
        Legs = 'Homam Cosciales', -- 3
        Feet = 'Homam Gambieras', -- 3
    },
    Haste_Ichi = { -- Optional, provided here only if you wish to mix in SIRD or other stats over max haste
        --Main = 'Tutelary',
        --Sub = 'Aegis',
    },

    Hate = { -- 1419
        --Main = 'Tutelary',
        --Sub = 'Koenig Shield',
        Head = 'Gallant Coronet',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hades Earring +1',
        Ear2 = 'Cassie Earring',
        Body = 'Gallant Surcoat',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Mermaid Ring',
        --Back = 'Valor Cape',
        Waist = 'Astral Rope',
        Legs = 'Custom Pants',
        Feet = 'Vlr. Leggings +1',
    },
    Hate_Flash = { -- Optional, provided here only if you wish to mix in haste or other stats over max +enmity
        --Main = 'Tutelary',
        --Sub = 'Koenig Shield',
        Head = 'Gallant Coronet',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hades Earring +1',
        Ear2 = 'Cassie Earring',
        Body = 'Gallant Surcoat',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Mermaid Ring',
        --Back = 'Valor Cape',
        Waist = 'Astral Rope',
        Legs = 'Custom Pants',
        Feet = 'Vlr. Leggings +1',
    },
    Cheat_C3HPDown = { -- 1207
        --Main = 'Durandal',
        --Sub = 'Aegis',
        --Range = 'Lightning Bow +1',
        Ammo = 'Tiphia Sting',
        Head = 'Emperor Hairpin', -- 2
        Body = 'Ducal Aketon',
        Neck = 'Peacock Amulet', -- 5
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Drone Earring', -- 9
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        --Back = 'Shadow Mantle',
        --Waist = 'Silver Obi +1', -- 8
        Legs = 'Custom Pants', -- 10
        Feet = 'Custom F Boots', -- 5
    },
    Cheat_C3HPUp = { -- 1430 (223)
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        Ammo = 'Happy Egg',
        Head = 'Gallant Coronet',
        Body = 'Gallant Surcoat',
        Neck = 'Shield Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Gallant Gauntlets',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Mermaid Ring',
        --Back = 'High Brth. Mantle',
        Waist = 'Astral Rope',
        Legs = 'Custom Pants',
        Feet = 'Gallant Leggings',
    },
    Cheat_C4HPDown = { -- 1072
        --Main = 'Durandal',
        --Sub = 'Aegis',
        --Range = 'Lightning Bow +1',
        Ammo = 'Tiphia Sting',
        Head = 'Emperor Hairpin',
        Neck = 'Peacock Amulet',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Drone Earring', -- 9
        Body = 'Ducal Aketon',
        Hands = 'Hydra Moufles',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        --Back = 'Shadow Mantle',
        Waist = 'Swift Belt', -- 8
        Legs = 'Custom Pants', -- 10
        Feet = 'Custom F Boots', -- 5
    },
    Cheat_C4HPUp = { -- 1514 (441 +1)
        --Main = 'Apollo\'s Staff',
        --Sub = '',
        --Range = 'Rosenbogen',
        Ammo = 'Happy Egg',
        Head = 'Gallant Coronet',
        Neck = 'Shield Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Gallant Surcoat',
        Hands = 'Gallant Gauntlets',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Mermaid Ring',
        --Back = 'Valor Cape',
        Waist = 'Astral Rope',
        Legs = 'Custom Pants',
        Feet = 'Gallant Leggings',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        Ammo = 'Tiphia Sting',
        Head = 'Luisant Salade',
        Body = 'Haubergeon',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Pallas\'s Bracelets',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Luisant Brayettes',
        Feet = 'Luisant Sollerets',
    },
    TP_HighAcc = {},
    TP_Mjollnir_Haste = {},

    WS = {
        Ammo = 'Tiphia Sting',
		Head = 'Luisant Salade',
        Neck = 'Soil Gorget',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Haubergeon',
        Hands = 'Pallas\'s Bracelets',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Life Belt',
        Legs = 'Luisant Brayettes',
        Feet = 'Marine F Boots',
    },
    WS_HighAcc = {},

    WS_Spirits = {},

    Cover = {
        Head = 'Gallant Coronet', -- This doesn't work on ASB anyway?...
        --Body = 'Vlr. Surcoat +1',
    },
    Cure = {
        --Main = 'Apollo\'s Staff',
        Ear1 = 'Hospitaler Earring',
		Head = 'Gallant Coronet',
		Neck = 'Peacock Amulet',
		Hands = 'Gallant Gauntlets',
    },
    Divine = {
		Neck = 'Divine Torque',
		Body = 'Gallant Surcoat',
		Hands = 'Devotee\'s Mitts',
		Legs = 'Custom Pants',
	},
    Rampart = { -- Rampart gives VIT x2 damage shield in era
        --Main = { Name = 'Durandal', Priority = -1 },
        --Sub = 'Koenig Shield',
        --Range = 'Rosenbogen',
        --Ammo = '',
        Head = 'Koenig Schaller',
        Neck = 'Fortitude Torque',
        Ear1 = 'Robust Earring',
        Ear2 = 'Robust Earring',
        Body = 'Gallant Surcoat',
        Hands = 'Kng. Handschuhs',
        Ring1 = 'Robust Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Adaman Cuisses',
        Feet = 'Power Sandals',
    },
    ShieldBash = {
        --Sub = 'Aegis',
        --Ear1 = 'Knightly Earring',
        --Hands = 'Vlr. Gauntlets +1',
		Ring1 = 'Guardian\'s Ring',
    },
    Enhancing = {
		Neck = 'Enhancing Torque',
	},
	Vermi = {
		Head = 'remove',
		Body = 'Vermillion Cloak',
	},
	Charm = {
		Main = 'Apollo\'s Staff',
		Sub = '',
		Legs = 'Custom Pants',
	},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 3')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //shieldbash')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //flash')
	
	--AshitaCore:GetChatManager():QueueCommand(-1, '/dps')
	--AshitaCore:GetChatManager():QueueCommand(-1, '/locktp')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()

    if (action.Name == 'Chivalry') then
        return
    end

    gFunc.EquipSet(sets.Hate)

    if (action.Name == 'Holy Circle' and gallant_leggings ~= '') then
        gFunc.Equip('Legs', gallant_leggings)
    elseif (action.Name == 'Rampart') then
        gFunc.EquipSet(sets.Rampart)
        local environment = gData.GetEnvironment()
        if (shadow_mantle and environment.DayElement == 'Dark') then
            gFunc.Equip('Back', 'Shadow Mantle')
        end
    elseif (action.Name == 'Shield Bash') then
        gFunc.EquipSet(sets.ShieldBash)
    elseif (action.Name == 'Sentinel' and valor_leggings ~= '') then
        gFunc.Equip('Legs', valor_leggings)
    elseif (action.Name == 'Cover') then
        gFunc.EquipSet(sets.Cover)
    end
	if (action.Name == 'Charm') then
        gFunc.EquipSet(sets.Charm)
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
    if (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    gcmelee.SetIsDPS(false)
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
    local cover = gData.GetBuffCount('Cover')

    if (cover >= 1) then
        gFunc.EquipSet(sets.Cover)
    end
	
	if (gData.GetBuffCount('Minuet') > 0) then
		gFunc.Equip('Ear1', 'Minuet Earring')
    end

    if (arco_de_velocidad) then
        local environment = gData.GetEnvironment()
        if (environment.Time >= 6 and environment.Time < 18 and player.HPP < 100) then
            gFunc.Equip('Range', 'Arco de Velocidad')
        end
    end
	if (player.MPP < 100 and player.Status ~= 'Engaged') then
        gFunc.EquipSet(sets.Vermi)
	end
	if (parade_gorget and player.HPP >= 85) then
        -- If gcmelee.GetIsDPS() is true, we ONLY equip it when NOT engaged
        if (gcmelee.GetIsDPS()) then
            if (player.Status ~= 'Engaged') then
                gFunc.Equip('Neck', 'Parade Gorget')
            end
        else
            -- If NOT in DPS mode, keep original behavior (equip regardless of engagement)
            gFunc.Equip('Neck', 'Parade Gorget')
        end
    end
    if (hercules_ring and player.HPP <= 50) then
        gFunc.Equip(hercules_ring_slot, 'Hercules\' Ring')
    end

    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local player = gData.GetPlayer()
    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    local cheatDelay = 0
    if (player.SubJob == "RDM" and warlocks_mantle) then
        cheatDelay = gcmelee.DoPrecast(fastCastValue + 0.02)
        gFunc.Equip('Back', 'Warlock\'s Mantle')
    else
        cheatDelay = gcmelee.DoPrecast(fastCastValue)
    end

    if (cheatDelay < 0) then
        cheatDelay = 0
    end
    local function delayCheat()
        if (target.Name == me) then
            if (action.Name == 'Cure III') then
                gFunc.ForceEquipSet(sets.Cheat_C3HPDown)
            elseif (action.Name == 'Cure IV') then
                gFunc.ForceEquipSet(sets.Cheat_C4HPDown)
            end
        end
    end

    delayCheat:once(cheatDelay)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local target = gData.GetActionTarget()
    local action = gData.GetAction()
    local me = AshitaCore:GetMemoryManager():GetParty():GetMemberName(0)

    if (action.Skill == 'Healing Magic') then
        gFunc.EquipSet(sets.Cure)
    elseif (action.Skill == 'Divine Magic') then
        if (action.Name == 'Flash') then
            local sentinel = gData.GetBuffCount('Sentinel')
            if (sentinel >= 1) then
                gFunc.EquipSet(sets.Haste)
            else
                gFunc.EquipSet(sets.Hate)
                gFunc.EquipSet(sets.Hate_Flash)
            end
        else
            gFunc.EquipSet(sets.Divine)
        end
    elseif (action.Skill == 'Ninjutsu') then
        gFunc.EquipSet(sets.Haste)
        if (action.Name == 'Utusemi: Ichi') then
            gFunc.EquipSet(sets.Haste_Ichi)
        end
    elseif (action.Skill == 'Enhancing Magic') then
        gFunc.EquipSet(sets.Enhancing)
    end

    if (target.Name == me) then
        if (action.Name == 'Cure III') then
            gFunc.EquipSet(sets.Cheat_C3HPUp)
        elseif (action.Name == 'Cure IV') then
            gFunc.EquipSet(sets.Cheat_C4HPUp)
        end
    end
end

return profile
