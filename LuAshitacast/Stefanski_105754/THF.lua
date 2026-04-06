local profile = {}

local fastCastValue = 0.07 -- 0% from gear

local ta_rogue_armlets = false
local displayheadOnAbility = true

local sets = {
    Idle = {
		Head = 'Optical Hat',
		Neck = 'Evasion Torque',
		Ear1 = 'Drone Earring',
		Ear2 = 'Novia Earring',
		Body = 'Scp. Harness +1',
		Hands = 'War Gloves +1',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Boxer\'s Mantle',
		Waist = 'Scouter\'s Rope',
		Legs = 'Raven Hose',
		Feet = 'Dance Shoes',
	},
    IdleALT = {},
    Resting = {
		Neck = 'Checkered Scarf',
		Ear1 = 'Sanative Earring',
	},
    Town = {
		Head = 'Homam Zucchetto',
		Neck = 'Peacock Amulet',
		Ear1 = 'Novia Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Rapparee Harness',
		Hands = 'Homam Manopolas',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Boxer\'s Mantle',
		Waist = 'Scouter\'s Rope',
		Legs = 'Homam Cosciales',
		Feet = 'Homam Gambieras',
	},
    Movement = {},

	DT = {
		Head = 'Darksteel Cap +1',
		Neck = 'Fortitude Torque',
		Ear1 = 'Knight\'s Earring',
		--Ear2 = 'Cassie Earring',
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
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Hands = 'Merman\'s Bangles',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s Ring',
	},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {
		Head = 'Optical Hat',
		Neck = 'Evasion Torque',
		Ear1 = 'Drone Earring',
		Ear2 = 'Novia Earring',
		Body = 'Scp. Harness +1',
		Hands = 'War Gloves +1',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Boxer\'s Mantle',
		Waist = 'Scouter\'s Rope',
		Legs = 'Raven Hose',
		Feet = 'Dance Shoes',
	},

    Precast = {
		Ear1 = 'Loquac. Earring',
		Legs = 'Homam Cosciales',
	},
    SIRD = {
		Head = 'Optical Hat',
		Neck = 'Evasion Torque',
		Ear1 = 'Drone Earring',
		Ear2 = 'Novia Earring',
		Body = 'Scp. Harness +1',
		Hands = 'War Gloves +1',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Boxer\'s Mantle',
		Waist = 'Scouter\'s Rope',
		Legs = 'Raven Hose',
		Feet = 'Dance Shoes',
    },
    Haste = { -- Used for Utsusemi cooldown
		Head = 'Homam Zucchetto',
		Ear1 = 'Loquac. Earring',
		Body = 'Rapparee Harness',
		Hands = 'Homam Manopolas',
		Waist = 'Swift Belt',
		Legs = 'Homam Cosciales',
		Feet = 'Homam Gambieras',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Head = 'Homam Zucchetto',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Rapparee Harness',
		Hands = 'Homam Manopolas',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Swift Belt',
		Legs = 'Homam Cosciales',
		Feet = 'Homam Gambieras',
	},
    TP_HighAcc = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Homam Corazza',
		Hands = 'Homam Manopolas',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Swift Belt',
		Legs = 'Homam Cosciales',
		Feet = 'Homam Gambieras',
	},
    TP_NIN = {
		--Ear1 = 'Merman\'s Earring',
		Ear1 = 'Stealth Earring',
		--Ear2 = 'Merman\'s Earring',
	},
    TP_Mjollnir_Haste = {},

    WS = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Hecatomb Mittens',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Homam Cosciales',
		Feet = 'Hct. Leggings',
	},
    WS_HighAcc = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Hecatomb Mittens',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Homam Cosciales',
		Feet = 'Hct. Leggings',
	},

    WS_Evisceration = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Hecatomb Harness',
		Hands = 'Hecatomb Mittens',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Homam Cosciales',
		Feet = 'Hct. Leggings',
	},
    WS_SharkBite = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Brutal Earring',
		Body = 'Dragon Harness',
		Hands = 'Hecatomb Mittens',
		Ring1 = 'Flame Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Homam Cosciales',
		Feet = 'Hct. Leggings',
	},
	WS_Elemental = {
		Head = 'Optical Hat',
		Neck = 'Peacock Amulet',
		Ear1 = 'Moldavite Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Blue Cotehardie',
		Hands = 'Tarasque Mitts +1',
		Ring1 = 'Grace Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Forager\'s Mantle',
		Waist = 'Warwolf Belt',
		Legs = 'Homam Cosciales',
		Feet = 'Bounding Boots',
	},
	
    SA = {
		Head = 'Emperor Hairpin',
		Ear1 = 'Intruder Earring',
		Body = 'Dragon Harness',
		Hands = 'Hecatomb Mittens',
		Ring1 = 'Grace Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Assassin\'s Cape',
		Waist = 'Warwolf Belt',
		Feet = 'Marine F Boots',
	},
    TA = {
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Head = 'Emperor Hairpin',
		Body = 'Dragon Harness',
		Legs = 'Rogue\'s Culottes',
		Feet = 'Custom F Boots',
		Back = 'Assassin\'s Cape',
		Waist = 'Warwolf Belt',
	},
    SATA = {
		Ring1 = 'Grace Ring',
		Ring2 = 'Rajas Ring',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Head = 'Emperor Hairpin',
		Body = 'Dragon Harness',
		Hands = 'Hecatomb Mittens',
		Legs = 'Rogue\'s Culottes',
		Feet = 'Bounding Boots',
		Back = 'Assassin\'s Cape',
		Waist = 'Warwolf Belt',
	},

    Flee = {
		Feet = 'Rogue\'s Poulaines',
	},
    Hide = {},
    Steal = {
		Head = 'Rogue\'s Bonnet',
		--Ear1 = 'Cassie Earring',
		Hands = 'Rogue\'s Armlets',
		Legs = 'Assassin\'s Culottes',
		Feet = 'Rogue\'s Poulaines',
		Ring2 = 'Bomb Queen Ring',
		Back = 'Gigant Mantle',
	},
    Mug = {
		Head = 'Assassin\'s Bonnet',
	},

    TH = {
		Neck = 'Nanaa\'s Charm',
		Hands = 'Assassin\'s Armlets',
		--Legs = 'Assassin\'s Cullotes',
	},

    Ranged = {
		Head = 'Optical Head',
		Neck = 'Peacock Amulet',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Head = 'Optical Hat',
		Body = 'Rapparee Harness',
		Hands = 'Noct Gloves +1',
		Ring1 = 'Merman\'s Ring',
		Ring2 = 'Merman\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Scouter\'s Rope',
		Legs = 'Noct Brais +1',
		Feet = 'Homam Gambieras',
	},
    Ranged_INT = {
		Ear1 = 'Omn. Earring',
		Ear2 = 'Drone Earring',
		Head = 'Rogue\'s Bonnet',
		Neck = 'Peacock Amulet',
		Body = 'Blue Cotehardie',
		Hands = 'Noct Gloves +1',
		Ring1 = 'Snow Ring',
		Ring2 = 'Snow Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Scouter\'s Rope',
		Legs = 'Noct Brais +1',
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

local saOverride = 0
local taOverride = 0
local taggedMobs = {}

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')
actionpacket = gFunc.LoadFile('common\\actionpacket.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Flee') then
        gFunc.EquipSet(sets.Flee)
    elseif (action.Name == 'Hide') then
        gFunc.EquipSet(sets.Hide)
    elseif (action.Name == 'Steal') then
        gFunc.EquipSet(sets.Steal)
    elseif (action.Name == 'Mug') then
        gFunc.EquipSet(sets.Mug)
    elseif (action.Name == 'Sneak Attack') then
        saOverride = os.clock() + 2
    elseif (action.Name == 'Trick Attack') then
        taOverride = os.clock() + 2
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
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

    local ammo = gData.GetEquipment().Ammo
    if (ammo ~= nil and ammo.Name == 'Bloody Bolt') then
        gFunc.EquipSet(sets.Ranged_INT)
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == 'Shark Bite') then
        gFunc.EquipSet(sets.WS_SharkBite)
	elseif (action.Name == 'Gust Slash' or action.Name == 'Cyclone') then
		gFunc.EquipSet(sets.WS_Elemental)
    end

    local ta = gData.GetBuffCount('Trick Attack')
    if (ta > 0) or (os.clock() < taOverride) then
        if (ta_rogue_armlets) then
            gFunc.Equip('Hands', 'Rogue\'s Armlets +1')
        end
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'th'})
    gcdisplay.CreateCycle('TH', {[1] = 'auto', [2] = 'on', [3] = 'off'})
    gcmelee.Load()
    profile.SetMacroBook()
    profile.WatchTreasureHunter()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'th'})
    ashita.events.unregister('packet_in', 'watch_treasure_hunter');
end

profile.HandleCommand = function(args)
    if (args[1] == 'th') then
        gcdisplay.AdvanceCycle('TH')
        gcinclude.Message('TH', gcdisplay.GetCycle('TH'))
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
	local environment = gData.GetEnvironment()
	
    if (player.SubJob == 'NIN' and player.Status == 'Engaged') then
        gFunc.EquipSet('TP_NIN')
    end
	
	--if (gData.GetBuffCount('Minuet') > 0) then
	--	gFunc.Equip('Ear2', 'Minuet Earring');
    --end

    gcmelee.DoDefaultOverride()
	if ((gcdisplay.IdleSet == 'Evasion' or player.Status == 'Idle') and conquest:GetOutsideControl()) then
        gFunc.Equip('Hands', 'Mst.Cst. Mitts')
    end
    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        gFunc.EquipSet(sets.SATA)
    elseif (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.SA)
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.TA)
    end
	--if (player.Status == 'Idle' and player.HPP < 95 and conquest:GetOutsideControl() and gcdisplay.IdleSet ~= 'Evasion') then
    --    gFunc.Equip('Head', 'President. Hairpin')
    --end
	if ((player.Status == 'Idle' or player.Status == 'Resting') and gcdisplay.IdleSet ~= 'Evasion' and gcdisplay.IdleSet ~= 'MDT') then
		if (environment.Time >= 6 and environment.Time < 18) then
			gFunc.Equip('Hands', 'Garden Bangles')
		end
    end
	if (gcdisplay.IdleSet == 'MDT' and conquest:GetOutsideControl()) then
		gFunc.Equip('Back', 'Resentment Cape')
	end
	
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))

    if (player.Status == 'Engaged' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
	gFunc.EquipSet(sets.TH)
    if (action.Skill ~= 'Ninjutsu' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.NeedTH = function()
    if (gcdisplay.GetCycle('TH') == 'auto') then
        local targetId
        local actionTarget = gData.GetActionTarget()

        if (actionTarget ~= nil) then
            targetId = actionTarget.Id
        else
            local targetIndex = gData.GetTargetIndex()
            if (targetIndex == 0) then
                return false
            end

            targetId = AshitaCore:GetMemoryManager():GetEntity():GetServerId(targetIndex)
        end

        if bit.band(targetId, 0xFF000000) ~= 0 then  --isMob
            return taggedMobs[targetId] == nil
        end

        return false
    end

    return gcdisplay.GetCycle('TH') == 'on'
end

profile.WatchTreasureHunter = function()
    ashita.events.register('packet_in', 'watch_treasure_hunter', function(e)
        local playerEntity = GetPlayerEntity();
        if (not playerEntity) then
            return
        end

        if (e.id == 0x28) then
            local type = T { 1, 2, 4, 6 };
            local packet = actionpacket:parse(e);
            if (packet.UserId == playerEntity.ServerId) then
                if (type:contains(packet.Type)) then
                    local reaction = T { 0, 8, 
                        9, -- melee/range attack missed, comment out for pedantic TH mode
                    }
                    for _, target in ipairs(packet.Targets) do
                        for i = 1, #target.Actions do
                            local action = target.Actions[1]
                            if bit.band(target.Id, 0xFF000000) ~= 0 then -- isMob, also triggers on NPC but it's benign
                                if reaction:contains(action.Reaction) and target.Id then
                                    taggedMobs[target.Id] = true;
                                end
                            end
                        end
                    end
                end
            end
        elseif (e.id == 0x29) then
            local deathMes = T { 6, 20, 97, 113, 406, 605, 646 };
            -- Mob died, clear from table
            local message = struct.unpack('i2', e.data, 0x18 + 1);
            if (deathMes:contains(message)) then
                local target = struct.unpack('i4', e.data, 0x08 + 1);
                taggedMobs[target] = nil;
            end
        elseif (e.id == 0x0A or e.id == 0x0B) then
            -- Changed zone, clear all TH
            taggedMobs = {};
        end
    end)
end

return profile
