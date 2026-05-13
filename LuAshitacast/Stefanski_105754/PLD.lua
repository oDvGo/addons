local profile = {}

local fastCastValue = 0.07 -- 7% from gear

local parade_gorget = true

local hercules_ring = true
local hercules_ring_slot = 'Ring1'

-- Replace these with '' if you do not have them
local gallant_leggings = 'Glt. Leggings +1'
local valor_leggings = 'Valor Leggings'

local arco_de_velocidad = false

local warlocks_mantle = true -- Don't add 2% to fastCastValue to this as it is SJ dependant

local shadow_mantle = false

local sets = {
    Idle = { -- 1415
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        Ammo = 'Fenrir\'s Stone',
        Head = 'Valor Coronet',
        Body = 'Valor Surcoat',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Homam Manopolas',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Valor Cape',
        Waist = 'Swift Belt',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
    },
    IdleALT = {
		Main = 'Terra\'s Staff',
        Sub = '',
        --Range = '',
        Ammo = 'Fenrir\'s Stone',
        Head = 'Hydra Salade',
        Body = 'Hydra Haubert',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Homam Manopolas',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
    },
    IdleDT = { -- 1415
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        Ammo = 'Fenrir\'s Stone',
        Head = 'Koenig Schaller', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = 'Shield Torque',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Kng. Handschuhs', -- 3
        Ring1 = 'Jelly Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Glt. Leggings +1',
    },
    IdleALTDT = {
		Main = 'Terra\'s Staff',
        Sub = '',
        --Range = '',
        Ammo = 'Fenrir\'s Stone',
        Head = 'Koenig Schaller', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = 'Fortitude Torque',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Kng. Handschuhs', -- 3
        Ring1 = 'Jelly Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    Resting = {
        --Main = 'Pluto\'s Staff',
        --Sub = 'remove',
		Head = '',
		Body = 'Vermillion Cloak',
		Neck = 'Parade Gorget',
        Ear1 = 'Relaxing Earring',
        --Ear2 = 'Sanative Earring',
		Waist = 'Hierarch Belt',
    },
    Town = {
        Main = 'Joyeuse',
        Sub = 'Koenig Shield',
        Range = '',
        Ammo = 'Fenrir\'s Stone',
        Head = 'Hydra Salade',
        Body = 'Hydra Haubert',
        Neck = 'Fortitude Torque',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Homam Manopolas',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Glt. Leggings +1',
    },
    Movement = {
        Legs = 'Crimson Cuisses',
    },

    DT = { -- 1415
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = 'Rosenbogen',
        --Ammo = '',
        Head = 'Koenig Schaller', -- 2
        Body = 'Dst. Harness +1', -- 4
        Neck = 'Shield Torque',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Kng. Handschuhs', -- 3
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1',
        Feet = 'Glt. Leggings +1',
    },
    MDT = { -- Shell IV provides 23% MDT
        Ammo = 'Phtm. Tathlum',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Cassie Earring',
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
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        Head = 'Koenig Schaller',
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Kng. Handschuhs',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = 'Dst. Subligar +1',
        Feet = 'Glt. Leggings +1',
    },
    Haste = { -- 1416
        --Main = { Name = 'Capricorn Staff', Priority = -1 }, -- 5
        --Sub = 'remove',
        Head = 'Homam Zucchetto',
        Neck = 'Willpower Torque',
        Ear1 = 'Loquac. Earring', -- FC
        Ear2 = 'Cassie Earring',
        Body = 'Dst. Harness +1',
        Hands = 'Homam Manopolas',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Merman\'s Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt', -- 6
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
        Head = 'Hydra Salade',
        Neck = 'Harmonia\'s Torque',
        --Ear1 = 'Hades Earring +1',
        Ear2 = 'Cassie Earring',
        Body = 'Hydra Haubert',
        Hands = 'Homam Manopolas',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
    },
    Hate_Flash = { -- Optional, provided here only if you wish to mix in haste or other stats over max +enmity
        --Main = 'Tutelary',
        --Sub = 'Koenig Shield',
        Head = 'Hydra Salade',
        Neck = 'Harmonia\'s Torque',
        --Ear1 = 'Hades Earring +1',
        Ear2 = 'Cassie Earring',
        Body = 'Hydra Haubert',
        Hands = 'Homam Manopolas',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Valor Cape',
        Waist = 'Swift Belt',
        Legs = 'Custom Pants',
        Feet = 'Dusk Ledelsens',
    },
    Cheat_C3HPDown = { -- 1207
        --Main = 'Durandal',
        --Sub = 'Aegis',
        --Range = 'Lightning Bow +1',
        --Ammo = 'Tiphia Sting',
        --Head = 'Emperor Hairpin', -- 2
        Body = 'Dst. Harness +1',
        Neck = 'Fortitude Torque', -- 5
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Magnetic Earring', -- 9
        Hands = 'Homam Manopolas',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt', -- 8
        Legs = 'Dst. Subligar +1', -- 10
        Feet = 'Dst. Leggings +1', -- 5
    },
    Cheat_C3HPUp = { -- 1430 (223)
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        --Ammo = 'Happy Egg',
        Head = 'Valor Coronet',
        Body = 'Valor Surcoat',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Cassie Earring',
        Hands = 'Homam Manopolas',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
    },
    Cheat_C4HPDown = { -- 1072
        --Main = 'Durandal',
        --Sub = 'Aegis',
        --Range = 'Lightning Bow +1',
        Ammo = 'Tiphia Sting',
        Head = 'Emperor Hairpin',
        Neck = 'Fortitude Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Magnetic Earring', -- 9
        Body = 'Dst. Harness +1',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Ether Ring',
        Ring2 = 'Serket Ring',
        Back = 'Boxer\'s Mantle',
        Waist = 'Swift Belt', -- 8
        Legs = 'Dst. Subligar +1', -- 10
        Feet = 'Dst. Leggings +1', -- 5
    },
    Cheat_C4HPUp = { -- 1514 (441 +1)
        --Main = 'Apollo\'s Staff',
        --Sub = '',
        --Range = 'Rosenbogen',
        Ammo = 'Happy Egg',
        Head = 'Valor Coronet',
        Neck = 'Harmonia\'s Torque',
        Ear1 = 'Hospitaler Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Valor Surcoat',
        Hands = 'Homam Manopolas',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Valor Leggings',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
        --Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        Ammo = 'Tiphia Sting',
        Head = 'Homam Zucchetto',
        Body = 'Homam Corazza',
        Neck = 'Peacock Amulet',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Brutal Earring',
        Hands = 'Homam Manopolas',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
    },
    TP_HighAcc = {
		--Main = 'Tutelary',
        --Sub = 'Aegis',
        --Range = '',
        Ammo = 'Tiphia Sting',
        Head = 'Homam Zucchetto',
        Body = 'Homam Corazza',
        Neck = 'Peacock Amulet',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Brutal Earring',
        Hands = 'Luisant Moufles',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Homam Cosciales',
        Feet = 'Homam Gambieras',
	},
    TP_Mjollnir_Haste = {},

    WS = {
        Ammo = 'Tiphia Sting',
		Head = 'Optical Hat',
        Neck = 'Soil Gorget',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Brutal Earring',
        Body = 'Hecatomb Harness',
        Hands = 'Tarasque Mitts +1',
        Ring1 = 'Flame Ring',
        Ring2 = 'Rajas Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
        Legs = 'Valor Breeches',
        Feet = 'Hct. Leggings',
    },
    WS_HighAcc = {},

    WS_Spirits = {},

    Cover = {
        --Head = 'Gallant Coronet', -- This doesn't work on ASB anyway?...
        Body = 'Valor Surcoat',
    },
    Cure = {
        --Main = 'Apollo\'s Staff',
		Head = 'Hydra Salade',
		Neck = 'Healing Torque',
        Ear1 = 'Hospitaler Earring',
		Ear2 = 'Cassie Earring',
		Body = 'Hydra Haubert',
		Hands = 'Homam Manopolas',
		Ring1 = 'Hercules\' Ring',
		Ring2 = 'Mermaid Ring',
		Back = 'Valor Cape',
		Waist = 'Warwolf Belt',
		Legs = 'Valor Breeches',
		Feet = 'Valor Leggings',
    },
    Divine = {
		Neck = 'Divine Torque',
		Body = 'Gallant Surcoat',
		Hands = 'Devotee\'s Mitts',
		Legs = 'Custom Pants',
		Feet = 'Valor Leggings',
		Back = 'Altruistic Cape',
	},
    Rampart = { -- Rampart gives VIT x2 damage shield in era
        --Main = { Name = 'Durandal', Priority = -1 },
        --Sub = 'Koenig Shield',
        --Range = 'Rosenbogen',
        --Ammo = '',
        Head = 'Valor Coronet',
        Neck = 'Fortitude Torque',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Cassie Earring',
        Body = 'Gallant Surcoat',
        Hands = 'Kng. Handschuhs',
        Ring1 = 'Hercules\' Ring',
        Ring2 = 'Mermaid Ring',
        Back = 'Valor Cape',
        Waist = 'Warwolf Belt',
        --Legs = 'Adaman Cuisses',
        Feet = 'Power Sandals',
    },
    ShieldBash = {
        --Sub = 'Aegis',
        --Ear1 = 'Knightly Earring',
        Hands = 'Valor Gauntlets',
		--Ring1 = 'Guardian\'s Ring',
    },
    Enhancing = {
		Neck = 'Enhancing Torque',
		Ring1 = 'Aqua Ring',
		Ring2 = 'Aqua Ring',
		Legs = 'Gallant Breeches',
		Back = 'Merciful Cape',
	},
	Vermi = {
		Head = 'remove',
		Body = 'Vermillion Cloak',
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
    gcinclude.SetAlias(T{'dw'})
    gcdisplay.CreateToggle('DW', false)
	gcmelee.Load()
    gcmelee.SetIsDPS(false)
	gcdisplay.CreateToggle('DPS', false)
	gcinclude.SetAlias(T{'vermi'})
	gcdisplay.CreateToggle('Vermi', true)
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
	gcinclude.ClearAlias(T{'vermi'})
	gcinclude.ClearAlias(T{'dw'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'dw') then
        gcdisplay.AdvanceToggle('DW')
        gcinclude.Message('DW', gcdisplay.GetToggle('DW'))
	else
        gcmelee.DoCommands(args)
    end
	if(args[1] == 'vermi') then
		gcdisplay.AdvanceToggle('Vermi')
        gcinclude.Message('Vermi', gcdisplay.GetToggle('Vermi'))
	end
    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
	if (gcmelee.GetIsDPS() ~= gcdisplay.GetToggle('DPS')) then
        gcdisplay.AdvanceToggle('DPS')
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local cover = gData.GetBuffCount('Cover')
	
    if (cover >= 1) then
        gFunc.EquipSet(sets.Cover)
    end
	
	if (gcdisplay.GetToggle('DW') and player.Status == 'Engaged' and gcmelee.GetIsDPS() and player.SubJob == 'NIN') then
        gFunc.Equip('Ear2', 'Stealth Earring')
		gFunc.Equip('Ammo', 'Virtue Stone')
    end
    if (arco_de_velocidad) then
        local environment = gData.GetEnvironment()
        if (environment.Time >= 6 and environment.Time < 18 and player.HPP < 100) then
            gFunc.Equip('Range', 'Arco de Velocidad')
        end
    end
	if (player.MPP < 90 and player.Status ~= 'Engaged' and gcdisplay.GetToggle('Vermi')) then
        gFunc.EquipSet(sets.Vermi)
	end
	if (parade_gorget and player.HPP >= 85 and player.MPP < 100) then
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
