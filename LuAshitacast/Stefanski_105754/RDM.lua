local profile = {}

local fastCastValue = 0.42 -- 20% from traits 22% from gear listed in Precast set

local ninSJMaxMP = 859 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 758 -- The Max MP you have when /whm in your idle set
local blmSJMaxMP = 788 -- The Max MP you have when /blm in your idle set
local drkSJMaxMP = 556 -- The Max MP you have when /drk in your idle set

local blue_cotehardie = false
local blue_cotehardie_plus_one = false
local dilation_ring = true
local dilation_ring_slot = 'Ring2'

local displayheadOnAbility = false

local sets = {
    Idle = {
        Main = 'Terra\'s Staff',
		Sub = '',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Gigant Mantle',
        Waist = 'Hierarch Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Dls. Boots +1',
    },
    IdleALT = {
        Main = 'Vulcan\'s Staff',
		Sub = '',
        Range = 'Expunger',
        Ammo = 'Scorpion Arrow',
        Head = 'Dls. Chapeau +1',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Gigant Mantle',
        Waist = 'Hierarch Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Dls. Boots +1',
    },
    IdleMaxMP = {
        Main = 'Terra\'s Staff',
		Sub = '',
        --Range = '',
        --Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Hexerei Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Crimson Cuisses',
        Feet = 'Dls. Boots +1',
    },
    Resting = {
        Main = 'Pluto\'s Staff',
		Sub = '',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Hydra Beret',
        Neck = 'Checkered Scarf',
        Ear1 = 'Relaxing Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Duelist\'s Belt',
        Legs = 'Hydra Brais',
        Feet = 'Dls. Boots +1',
    },
    Town = {
		Main = 'Terra\'s Staff',
		Sub = '',
		Range = '',
		Ammo = 'Hedgehog Bomb',
		Head = 'Dls. Chapeau +1',
		Body = 'Wlk. Tabard +1',
		Neck = 'Fortitude Torque',
		Ear1 = 'Knight\'s Earring',
		Ear2 = 'Moldavite Earring',
		Hands = 'Dls. Gloves +1',
		Ring1 = 'Fencer\'s Ring',
		Ring2 = 'Dilation Ring',
		Back = 'Altruistic Cape',
		Waist = 'Swift Belt',
        Legs = 'Dls. Tights +1',
		Feet = 'Dls. Boots +1',
	},
    Movement = {
		Hands = 'Dls. Gloves +1',
		Legs = 'Crimson Cuisses',
		Feet = 'Marine F Boots',
    },

    DT = {
        Main = 'Terra\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Dst. Mittens +1', -- 2
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Umbra Cape', -- 6
        Waist = 'Warwolf Belt',
        Legs = 'Dst. Subligar +1', -- 3
        Feet = 'Dst. Leggings +1', -- 2
    },
    DTNight = {
        Main = 'Terra\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Dst. Harness +1', -- 4
        Hands = 'Dst. Mittens +1', -- 2
        Ring1 = 'Jelly Ring', -- 5
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Umbra Cape', -- 12
        Waist = 'Warwolf Belt',
        Legs = 'Blood Cuisses',
        Feet = 'Dst. Leggings +1', -- 2
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Terra\'s Staff',
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Dls. Chapeau +1',
        Neck = 'Jeweled Collar +1',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Body = 'Cor. Scale Mail +1', -- 4
        Hands = 'Coral Fng. Gnt. +1', -- 2
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Hexerei Cape', -- 3
        Waist = 'Penitent\'s Rope',
        Legs = 'Coral Cuisses +1', -- 3
        Feet = 'Coral Greaves +1', -- 2
    },
    FireRes = { -- 145
        Main = 'Neptune\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Scp. Breastplate', -- 9
        Hands = 'Tarasque Mitts +1', -- 6
        Ring1 = 'Triumph Ring', -- 10
        Ring2 = 'Malflame Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Water Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Power Sandals', -- 7
    },
    IceRes = { -- 145
        Main = 'Vulcan\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Northern Jerkin', -- 6
        Hands = 'Feral Gloves', -- 4
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
        Back = 'Aurora Mantle', -- 7
        Waist = 'Fire Belt', -- 20
        Legs = 'Feral Trousers', -- 6
        Feet = 'Blood Greaves', -- 21
    },
    LightningRes = { -- 133
        Main = 'Terra\'s Staff', -- 20
        Range = 'Lightning Bow +1', -- 7
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
        Back = 'Lightning Mantle', -- 6
        Waist = 'Earth Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Dst. Leggings +1',
    },
    EarthRes = { -- 144
        Main = 'Auster\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Body = 'Gaia Doublet', -- 10
        Hands = 'Coral Fng. Gnt. +1',
        Ring1 = 'Robust Ring', -- 10
        Ring2 = 'Maldust Ring', -- 10
        Back = 'Beak Mantle +1', -- 7
        Waist = 'Wind Belt', -- 20
        Legs = 'Beak Trousers +1', -- 7
        Feet = 'Blood Greaves', -- 21
    },
    WindRes = { -- 139
        Main = 'Aquilo\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Body = 'Northern Jerkin', -- 6
        Hands = 'Mage\'s Cuffs', -- 5
        Ring1 = 'Emerald Ring', -- 9
        Ring2 = 'Malgust Ring', -- 10
        Back = 'Aurora Mantle', -- 7
        Waist = 'Ice Belt', -- 20
        Legs = 'Coral Cuisses +1',
        Feet = 'Blood Greaves', -- 21
    },
    WaterRes = { -- 137
        Main = 'Jupiter\'s Staff', -- 20
        Range = 'Arco de Velocidad',
        Ammo = '',
        Head = 'Black Ribbon', -- 10
        Neck = 'Jeweled Collar +1', -- 10
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Body = 'Cor. Scale Mail +1', -- 6
        Hands = 'Coral Fng. Gnt. +1', -- 4
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Lightning Belt', -- 20
        Legs = 'Blood Cuisses', -- 21
        Feet = 'Coral Greaves +1', -- 4
    },
    Evasion = {
		Main = 'Auster\'s Staff',
		Sub = '',
		Range = '',
		Ammo = 'Happy Egg',
		Head = 'Optical Hat',
		Body = 'Scp. Harness +1',
		Feet = 'Marine F Boots',
		Ring1 = 'Snow Ring',
		Back = 'Traveler\'s Mantle',
		Waist = 'Warwolf Belt',
	},

    Precast = {
        Head = 'Wlk. Chapeau +1',
        Ear1 = 'Loquac. Earring',
        Body = 'Duelist\'s Tabard',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        -- Main = 'Light Staff',
		--Range = '',
        --Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Uggalepih Pendant',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Wlk. Tabard +1',
        Hands = 'Dusk Gloves',
        --Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Hexerei Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens',
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        -- Main = 'Light Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dls. Boots +1',
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        -- Main = 'Light Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Dusk Gloves',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Astute Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens',
    },
    ConserveMP = {
        -- Ammo = 'Dream Sand',
        Ear2 = 'Magnetic Earring',
        -- Back = 'Maledictor\'s Shawl',
    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel and Bind if /hate is toggled on
        --Main = 'Dark Staff',
        Range = '',
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Rainbow Cape',
        Waist = 'Royal Knight\'s belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dls. Boots +1',
    },
    Cheat_C3HPDown = {
        --Main = 'Light Staff',
		Sub = '',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Healing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Druid\'s Slops',
        Feet = 'Dls. Boots +1',
    },
    Cheat_C4HPDown = {
        --Main = 'Light Staff',
		Sub = '',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Healing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Druid\'s Slops',
        Feet = 'Dls. Boots +1',
    },
    Cheat_HPUp = {
        --Main = 'Light Staff',
		Sub = '',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Healing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Druid\'s Slops',
        Feet = 'Dls. Boots +1',
    },

    Cure = {
        --Main = 'Light Staff',
		Sub = '',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Healing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Druid\'s Slops',
        Feet = 'Dls. Boots +1',
    },
    Cursna = {
        --Main = 'Light Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Healing Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Rainbow Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Warlock\'s Tights',
        Feet = 'Dls. Boots +1',
    },

    Enhancing = {
        -- Main = 'Light Staff',
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enhancing torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Glamor Jupon',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Warlock\'s Tights',
        Feet = 'Dls. Boots +1',
    },
    Stoneskin = {
        Range = '',
        Ammo = 'Hedgehog Bomb',
        Head = 'Dls. Chapeau +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Dls. Boots +1',
    },
    Spikes = {
        -- Main = 'Aquilo\'s Staff',
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enhancing Torque',
        --Ear1 = 'Novio Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Dls. Tights +1',
        --Feet = 'Dls. Boots +1',
    },

    Enfeebling = {
        Range = '',
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Wlk. Tabard +1',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Nashira Seraweels',
        Feet = 'Dls. Boots +1',
    },
    EnfeeblingMND = {
        Range = '',
        Ammo = 'Phtm. Tathlum',
        Head = 'Dls. Chapeau +1',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Wlk. Tabard +1',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Nashira Seraweels',
        Feet = 'Dls. Boots +1',
    },
    EnfeeblingINT = {
        Range = '',
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Wlk. Tabard +1',
        Hands = 'Dls. Gloves +1', 
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Nashira Seraweels',
        Feet = 'Dls. Boots +1',
    },
    EnfeeblingACC = {
        Range = '',
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Enfeebling Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Magnetic Earring',
        Body = 'Wlk. Tabard +1',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Altruistic Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Nashira Seraweels',
        Feet = 'Dls. Boots +1',
    },

    Divine = { -- Just using my Hate set here for Flash
        --Ammo = 'Phtm. Tathlum',
        --Head = 'Rival Ribbon', -- 2
        Neck = 'Divine Torque', -- 3
        --Ear1 = 'Eris\' Earring', -- 2
        --Ear2 = 'Hades Earring +1', -- 2
        --Body = 'Dls. Tabard +1',
        --Hands = 'Dusk Gloves +1',
        --Ring1 = 'Mermaid Ring', -- 2
        --Ring2 = 'Sattva Ring', -- 5
        --Back = 'Toreador\'s Cape', -- 4
        --Waist = 'Warwolf Belt', -- 3
        --Legs = 'Nashira Seraweels',
        --Feet = 'Heroic Boots', -- 1
    },
    Dark = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Nashira Manteel',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Nashira Seraweels',
        Feet = 'Dls. Boots +1',
    },

    Nuke = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Errant Hpl.',
        Hands = 'Zenith Mitts',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Dls. Tights +1',
        Feet = 'Dls. Boots +1',
    },
    NukeACC = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Omn. Earring',
        Ear2 = 'Moldavite Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Dls. Tights +1',
        Feet = 'Dls. Boots +1',
    },
    NukeDOT = {
        Ammo = 'Phtm. Tathlum',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Elemental Torque',
        Ear1 = 'Elemental Earring',
        Ear2 = 'Omn. Earring',
        Body = 'Wlk. Tabard +1',
        Hands = 'Dls. Gloves +1',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Dls. Tights +1',
        Feet = 'Dls. Boots +1',
        
    },

    Convert = { -- Type /vert to equip this set and /lock your gear at the same time.
        --Main = 'Apollo\'s Staff',
        --Ammo = 'Hedgehog Bomb',
        --Head = 'Faerie Hairpin',
        --Neck = 'Uggalepih Pendant',
        --Ear1 = 'Loquac. Earring',
        --Ear2 = 'Magnetic Earring',
        --Body = 'Blue Cotehard. +1',
        --Hands = 'Zenith Mitts +1',
        --Ring1 = 'Ether Ring',
        --Ring2 = 'Serket Ring',
        --Back = 'Errant Cape',
        --Waist = 'Hierarch Belt',
        --Legs = 'Blood Cuisses',
        --Feet = 'Blood Greaves',
    },
    ConvertOOR = { -- Out of Region Convert Set
        --Main = 'Apollo\'s Staff',
        --Ammo = 'Hedgehog Bomb',
        --Head = 'Faerie Hairpin',
        --Neck = 'Rep.Gold Medal',
        --Ear1 = 'Loquac. Earring',
        --Ear2 = 'Magnetic Earring',
        --Body = 'Wlk. Tabard +1',
        --Hands = 'Zenith Mitts +1',
        --Ring1 = 'Ether Ring',
        --Ring2 = 'Serket Ring',
        --Back = 'Errant Cape',
        --Waist = 'Hierarch Belt',
        --Legs = 'Blood Cuisses',
        --Feet = 'Blood Greaves',
    },

    Stun = {
        --Main = 'Dark Staff',
        Ammo = '',
        Head = 'Wlk. Chapeau +1',
        Neck = 'Dark Torque',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Omn. Earring',
        Body = 'Nashira Manteel',
        Hands = 'Dusk Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens',
    },
    StunACC = { -- You can also type /csstun to equip this set and /lock your gear at the same time if you have a tinfoil hat.
        --Main = 'Dark Staff',
        Ammo = '',
        Head = 'Nashira Turban',
        Neck = 'Dark Torque',
        Ear1 = 'Magnetic Earring',
        Ear2 = 'Omn. Earring',
        Body = 'Nashira Manteel',
        Hands = 'Dusk Gloves',
        Ring1 = 'Snow Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Merciful Cape',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens',
    },

    TP = {
        
        Main = 'Joyeuse',
		Sub = 'Strike Shield',
        Range = '',
        Ammo = 'Tiphia Sting',
        Head = 'Dls. Chapeau +1',
        Neck = 'Fortitude Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Knight\'s Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Dusk Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens',
    },
    TP_HighAcc = {
        Main = 'Joyeuse',
		Sub = 'Strike Shield',
		Range = '',
        Ammo = 'Tiphia Sting',
        Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Knight\'s Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Dusk Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Hydra Brais',
        Feet = 'Marine F Boots',
    },
    TP_NIN = {
        Main = 'Enhancing Sword',
		Sub = 'Joyeuse',
		Range = '',
        Ammo = 'Tiphia Sting',
		Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Stealth Earring',
        Ear2 = 'Knight\'s Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Dusk Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens',
    },
    TP_Mjollnir_Haste = {
		Head = 'Optical Hat',
        Neck = 'Peacock Amulet',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Knight\'s Earring',
        Body = 'Scp. Harness +1',
        Hands = 'Dusk Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Swift Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Dusk Ledelsens',
	},
    WS = {
        Head = 'Optical Hat',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Knight\'s Earring',
        Body = 'Assault Jerkin',
        Hands = 'Ogre Gloves +1',
		Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
		Ring1 = 'Flame Ring',
        Legs = 'Hydra Brais',
        Feet = 'Marine F Boots',
    },
    WS_HighAcc = {
        Head = 'Optical Hat',
        --Ear2 = 'Merman\'s Earring',
        Body = 'Assault Jerkin',
        Hands = 'Ogre Gloves +1',
		Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
		Ring1 = 'Flame Ring',
        Legs = 'Hydra Brais',
        --Feet = 'Rutter Sabatons',
    },
    WS_Soil = {
        Neck = 'Soil Gorget',
    },
    WS_Evisceration = {
        Hands = 'Ogre Gloves +1',
    },
	WS_Savage_Blade = {
        Head = 'Optical Hat',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Knight\'s Earring',
		Neck = 'Soil Gorget',
        Body = 'Assault Jerkin',
        Hands = 'Ogre Gloves +1',
		Legs = 'Hydra Brais',
		Feet = 'Dls. Boots +1',
		Back = 'Forager\'s Mantle',
        Waist = 'Warwolf Belt',
		Ring1 = 'Aqua Ring',
		Ring2 = 'Toreador\'s Ring',
        Feet = 'Dls. Boots +1',
    },
    WS_Spirits = {},
    WS_Energy = {
        Head = 'Zenith Crown +1',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Neck = 'Faith Torque',
        Body = 'Mahatma Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Mahatma Slops',
        Feet = 'Mahatma Pigaches',
    },
	
	Ranged = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Ear2 = 'Brutal Earring',
		Body = 'Duelist\'s Tabard',
		Ring1 = 'Woodsman Ring',
		Ring2 = 'Snow Ring',
		Back = 'Amemet Mantle +1',
		Legs = 'Republic Subligar',
		Feet = 'Custom F Boots',
	},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
	AshitaCore:GetChatManager():QueueCommand(-1, '/lockstyle on')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //dia')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //stun')
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
	gFunc.EquipSet(sets.Ranged)
end

profile.HandleWeaponskill = function()
    local action = gData.GetAction()

    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end
    gcmage.DoFenrirsEarring()

    if (action.Name == 'Vorpal Blade') or (action.Name == 'Swift Blade') then
        gFunc.EquipSet(sets.WS_Soil)
    end

    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Soil)
        gFunc.EquipSet(sets.Evisceration)
    end
	
	if (action.Name == 'Savage Blade') then
		gFunc.EquipSet(sets.WS_Savage_Blade)
	end

    if (action.Name == 'Energy Drain') or (action.Name == 'Energy Steal') then
        gFunc.EquipSet(sets.WS_Energy)
    end

    if (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
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
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP)

    local player = gData.GetPlayer()
    if (blue_cotehardie and player.MP <= 40) then
        gFunc.Equip('Body', 'Blue Cotehardie')
    end
    if (blue_cotehardie_plus_one and player.MP <= 50) then
        gFunc.Equip('Body', 'Blue Cotehard. +1')
    end
	if (player.MP <= 140 and player.Status == 'Engaged') then
        gFunc.Equip('Head', 'Dls. Chapeau +1')
		gFunc.Equip('Legs', 'Hydra Brais')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP)

    local action = gData.GetAction()
    if (dilation_ring) then -- Haste is technically MP inefficient but I prefer to just always use it anyway
        if (action.Name == 'Haste' or action.Name == 'Refresh') then
            gFunc.Equip(dilation_ring_slot, 'Dilation Ring')
        end
    end
end

return profile
