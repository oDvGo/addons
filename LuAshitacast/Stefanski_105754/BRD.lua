local profile = {}

local fastCastValue = 0.04 -- Only include Fast Cast e.g. Loquacious Earring, Rostrum Pumps
local fastCastValueSong = 0.37 -- Only include Song Spellcasting Time e.g. Minstrel's Ring, Sha'ir Manteel

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 188 -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local displayheadOnAbility = false

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
        Range = 'Faerie Piccolo',
        Ear1 = 'Melody Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Optical Hat',
        Body = 'Scp. Harness +1',
        Hands = 'Bard\'s Cuffs',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Bard\'s Cape',
        Waist = 'Warwolf Belt',
        Legs = 'Hydra Brais',
        Feet = 'Choral Slippers',
        Neck = 'Wind Torque',
    },
    IdleALT = {
        Main = 'Terra\'s Staff',
        Range = 'Mythic Harp +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Scouter\'s Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
        Neck = 'Jeweled Collar',
    },
    IdleMaxMP = {},
    Resting = {
        Main = 'Pluto\'s Staff',
        Head = 'Hydra Beret',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant hpl.',
        Hands = 'Hydra Gloves',
        Back = 'Errant Cape',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Town = {
        Range = 'Faerie Piccolo',
    },
    Movement = {},

    DT = {},
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Terra\'s Staff',
        Range = 'Mythic Harp +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'displaced',
        Body = 'Royal Cloak',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Hexerei Cape',
        Waist = 'Scouter\'s Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
        Neck = 'Jeweled Collar',
    },
    FireRes = {
        Main = 'Neptune\'s Staff',
        Head = 'Green Ribbon +1',
        Neck = 'Enfeebling Torque',
        Body = 'Dst. Harness +1',
        Ear1 = 'Ruby Earring',
        Ear2 = 'Ruby Earring',
        Ring1 = 'Ruby Ring',
        Ring2 = 'Malflame Ring',
        Feet = 'Suzaku\'s Sune-ate',
    },
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast_Songs_HPDown = { -- This set will equip even before precast for songs in case you require HP Down equipment to trigger Minstrel's Ring
		--Head = 'Zenith Crown',
		Range = '',
		--Ammo = 'Tiphia Sting',
		Neck = 'Checkered Scarf',
		Body = 'Errant Hpl.',
		Hands = 'Zenith Mitts',
		--Feet = 'Rostrum Pumps',
		Waist = 'Penitent\'s Rope',
	},
    Precast = {
       Ear1 = 'Loquac. Earring',
       Feet = 'Rostrum Pumps',
    },
    Precast_Songs = {
        --Main = 'Tutelary',
        --Sub = 'She-slime Shield',
        --Ammo = 'Happy Egg',
        Head = 'Genbu\'s Kabuto',
        Neck = 'Wind Torque',
        Ear1 = 'Melody Earring',
        Ear2 = 'Loquac. Earring',
        Body = 'Sha\'ir Manteel',
        Hands = 'Seiryu\'s Kote',
        Ring1 = 'Minstrel\'s Ring',
        Ring2 = 'Bomb Queen Ring',
        Back = 'Gigant Mantle',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Marine F Boots',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Main = 'Terra\'s Staff',
        Range = 'Mythic Harp +1',
        Neck = 'Jeweled Collar',
        --Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Head = 'Darksteel Cap +1',
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Merman\'s Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
        Waist = 'Powerful Rope',
        Legs = 'Dst. Subligar +1',
        Feet = 'Dst. Leggings +1',
    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Neck = 'Willpower Torque',
        Waist = 'Druid\'s Rope',
        Feet = 'Mountain Gaiters',
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Range = 'Angel Lyre',
        Body = 'Sha\'ir Manteel',
        Ear1 = 'Magnetic Earring',
        Hands = 'Dusk Gloves',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
    },
    ConserveMP = {
        Ear2 = 'Magnetic Earring',
    },

    Sing_Default = {
        Range = 'Faerie Piccolo',
        Head = 'Bard\'s Roundlet',
        Neck = 'Wind Torque',
        Ear1 = 'Singing Earring',
        Ear2 = 'Musical Earring',
        Hands = 'Cholar Cuffs',
		Body = 'Minstrel\'s Coat',
        Legs = 'Choral Cannions',
        Ring1 = 'Allure Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Astute Cape',
    },
    Sing_Buff = {
        Head = 'Bard\'s Roundlet',
		Neck = 'Wind Torque',
		Main = 'Chanter\'s Staff',
		Body = 'Minstrel\'s Coat',
        Legs = 'Choral Cannions',
		Ring1 = 'Allure Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Astute Cape',
    },
    Sing_Debuff = {
        Head = 'Bard\'s Roundlet',
		Neck = 'Wind Torque',
		Body = 'Minstrel\'s Coat',
        Ring1 = 'Luftpause Mark',
        Ring2 = 'Tamas Ring',
        Waist = 'Gleeman\'s Belt',
        Legs = 'Choral Cannions',
        Feet = 'Sha\'ir Crackows',
        Back = 'Astute Cape',
    },

    Sing_Ballad_Large = {
        --Range = 'Angel Lyre',
        Body = 'Sha\'ir Manteel',
        Hands = 'Sheikh Gages',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
    },
    Sing_Ballad_Small = {
        --Range = 'Angel Lyre',
        Body = 'Sha\'ir Manteel',
        Hands = 'Sheikh Gages',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
    },
    Sing_Paeon = {
        Range = 'Harp +1',
        Neck = 'String Torque',
    },
    Sing_Mazurka = {
        Range = 'Faerie Piccolo',
    },
     Sing_Minuet = {
        Range = 'Cornette +1',
    },
    Sing_March = {
        Range = 'Faerie Piccolo',
    },
    Sing_Madrigal = {
        Range = 'Traversiere +1',
    },
    Sing_Elegy = {
        Range = 'Horn +1',
        Main = 'Terra\'s Staff',
    },
    Sing_Lullaby = {
        Range = 'Mary\'s Horn',
        Main = 'Light Staff',
    },
    Sing_HordeLullaby_Large = {
        Range = 'Mary\'s Horn',
        Main = 'Light Staff',
        Neck = 'String Torque',
        Legs = 'Mahatma Slops',
    },
    Sing_HordeLullaby_Small = {
        Range = 'Mary\'s Horn',
        Main = 'Light Staff',
    },
    Sing_SleepRecast = {
        Hands = 'Sheikh Gages',
    },
    Sing_FinaleRequiem = {
        Range = 'Flute +1',
        Main = 'Light Staff',
    },
    Sing_Carol = {
        Range = 'Faerie Piccolo',
    },
    Sing_Mambo = {
        Range = 'Faerie Piccolo',
    },
    Sing_Prelude = {
        Range = 'Angel\'s Flute +1',
    },
    Sing_Threnody = {
        Range = 'Piccolo +1',
        Neck = 'String Torque',
        Legs = 'Mahatma Slops',
    },
    Sing_Hymnus = {
        Range = 'Angel Lyre',
        Neck = 'String Torque',
        Hands = 'Sheikh Gages',
        Body = 'Sha\'ir Manteel',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
    },

    Cure = {
        Main = 'Light Staff',
        Head = 'Hydra Beret',
        Neck = 'Justice Badge',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Hydra Doublet',
        Hands = 'Hydra Gloves',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Errant Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },
    Cursna = {},

    Enhancing = {
        Ear1 = 'Magnetic Earring',
    },
    Stoneskin = {
        Main = 'Chanter\'s Staff',
        Head = 'Hydra Beret',
        Neck = 'Stone Gorget',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Geist Earring',
        Body = 'Mahatma hpl.',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Aqua Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Suzaku\'s Sune-ate',
    },
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Divine = {},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP = {
        Main = 'Joyeuse',
		Sub = 'Genbu\'s Shield',
        Range = 'Angel Lyre',
        Ammo = '',
        Head = 'Optical Hat',
        Neck = 'Fortitude Torque',
        Ear1 = 'Knight\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Haubergeon',
        Hands = 'Dusk Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Bard\'s Cape',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Dusk Ledelsens',
	},
    TP_HighAcc = {},
    TP_NIN = {},
    TP_Mjollnir_Haste = {},
    WS = {},
    WS_HighAcc = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 9')
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
    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'sballad','shorde','srecast'})
    gcdisplay.CreateToggle('SmallBallad', false)
    gcdisplay.CreateToggle('SmallHorde', false)
    gcdisplay.CreateToggle('SleepRecast', false)
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
    gcinclude.ClearAlias(T{'sballad','shorde','srecast'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'sballad') then
        gcdisplay.AdvanceToggle('SmallBallad')
        gcinclude.Message('SmallBallad', gcdisplay.GetToggle('SmallBallad'))
    elseif (args[1] == 'shorde') then
        gcdisplay.AdvanceToggle('SmallHorde')
        gcinclude.Message('SmallHorde', gcdisplay.GetToggle('SmallHorde'))
    elseif (args[1] == 'srecast') then
        gcdisplay.AdvanceToggle('SleepRecast')
        gcinclude.Message('SleepRecast', gcdisplay.GetToggle('SleepRecast'))
    else
        gcmage.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.ForceEquipSet('Precast_Songs_HPDown')
        gFunc.EquipSet(sets.Precast_Songs)
        local totalFastCast = 1 - (1 - fastCastValueSong) * (1 - fastCastValue)
        gcmage.DoPrecast(totalFastCast)
    else
        gcmage.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.EquipSet(sets.Sing_Default)

        if string.match(action.Name, 'Threnody') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Threnody)
        elseif string.match(action.Name, 'Elegy') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Elegy)
        elseif string.match(action.Name, 'Foe Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Lullaby)
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif string.match(action.Name, 'Horde Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_HordeLullaby_Large)
            if (gcdisplay.GetToggle('SmallHorde')) then
                gFunc.EquipSet(sets.Sing_HordeLullaby_Small)
            end
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif (action.Name == 'Magic Finale') or string.match(action.Name, 'Requiem') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_FinaleRequiem)
        elseif string.match(action.Name, 'Carol') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Carol)
        elseif string.match(action.Name, 'Ballad') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Ballad_Large)
            if (gcdisplay.GetToggle('SmallBallad')) then
                gFunc.EquipSet(sets.Sing_Ballad_Small)
            end
        elseif string.match(action.Name, 'Minuet') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Minuet)
        elseif string.match(action.Name, 'March') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_March)
        elseif string.match(action.Name, 'Madrigal') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Madrigal)
        elseif string.match(action.Name, 'Mambo') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mambo)
        elseif string.match(action.Name, 'Prelude') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Prelude)
        elseif string.match(action.Name, 'Hymnus') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Hymnus)
        elseif (action.Name == 'Chocobo Mazurka') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mazurka)
        elseif string.match(action.Name, 'Paeon') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Paeon)
        end
    end
end

return profile
