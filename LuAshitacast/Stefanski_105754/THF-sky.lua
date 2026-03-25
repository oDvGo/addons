local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local ta_rogue_armlets = false
local displayheadOnAbility = true

local sets = {
    Idle = {
		Head = 'Emperor Hairpin',
		Neck = 'Evasion Torque',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Battle Gloves',
		Ring1 = 'Jelly Ring',
		Ring2 = 'Scorpion Ring +1',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Raven Hose',
		Feet = 'Marine F Boots',
	},
    IdleALT = {},
    Resting = {
		Neck = 'Checkered Scarf',
		Ear1 = 'Sanative Earring',
	},
    Town = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Body = 'Rapparee Harness',
		Hands = 'Noct Gloves +1',
		Ring1 = 'Scorpion Ring +1',
		Ring2 = 'Rajas Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Bravo\'s Subligar',
		Feet = 'Marine F Boots',
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
    Evasion = {
		Head = 'Emperor Hairpin',
		Neck = 'Evasion Torque',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Battle Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Raven Hose',
		Feet = 'Bounding Boots',
	},

    Precast = {},
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
		Body = 'Rapparee Harness',
		Waist = 'Swift Belt',
		Legs = 'Bravo\'s Subligar',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Spike Earring',
		Body = 'Rapparee Harness',
		Hands = 'Battle Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Bravo\'s Subligar',
		Feet = 'Marine F Boots',
	},
    TP_HighAcc = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Spike Earring',
		Body = 'Scp. Harness +1',
		Hands = 'Battle Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Toreador\'s Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Swift Belt',
		Legs = 'Bravo\'s Subligar',
		Feet = 'Marine F Boots',
	},
    TP_NIN = {
		Ear1 = 'Optical Earring',
		--Ear1 = 'Stealth Earring',
		--Ear2 = 'Merman\'s Earring',
	},
    TP_Mjollnir_Haste = {},

    WS = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Black Cotehardie',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Republic Subligar',
		Feet = 'Marine F Boots',
	},
    WS_HighAcc = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Black Cotehardie',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Republic Subligar',
		Feet = 'Marine F Boots',
	},

    WS_Evisceration = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Black Cotehardie',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Republic Subligar',
		Feet = 'Marine F Boots',
	},
    WS_SharkBite = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Merman\'s Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Black Cotehardie',
		Hands = 'Custom F Gloves',
		Ring1 = 'Toreador\'s Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Republic Subligar',
		Feet = 'Marine F Boots',
	},
	WS_Elemental = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Moldavite Earring',
		Ear2 = 'Merman\'s Earring',
		Body = 'Black Cotehardie',
		Hands = 'Custom F Gloves',
		Ring1 = 'Grace Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Amemet Mantle +1',
		Waist = 'Life Belt',
		Legs = 'Republic Subligar',
		Feet = 'Bounding Boots',
	},
	
    SA = {
		Head = 'Emperor Hairpin',
		Body = 'Black Cotehardie',
		Hands = 'Custom F Gloves',
		Ring1 = 'Grace Ring',
		Ring2 = 'Rajas Ring',
		Back = 'Assassin\'s Cape',
		Waist = 'Life Belt',
	},
    TA = {
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Head = 'Emperor Hairpin',
		Body = 'Black Cotehardie',
		Legs = 'Rogue\'s Culottes',
		Feet = 'Custom F Boots',
		Back = 'Assassin\'s Cape',
		Waist = 'Life Belt',
	},
    SATA = {
		Ring1 = 'Grace Ring',
		Ring2 = 'Rajas Ring',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Head = 'Emperor Hairpin',
		Body = 'Black Cotehardie',
		Hands = 'Custom F Gloves',
		Legs = 'Rogue\'s Culottes',
		Feet = 'Bounding Boots',
		Back = 'Assassin\'s Cape',
		Waist = 'Life Belt',
	},

    Flee = {
		Feet = 'Rogue\'s Poulaines',
	},
    Hide = {},
    Steal = {
		Head = 'Rogue\'s Bonnet',
		Feet = 'Rogue\'s Poulaines',
		Ring2 = 'Bomb Queen Ring',
		Back = 'Gigant Mantle',
	},
    Mug = {},

    TH = {
		--Neck = 'Nanaa\'s Charm',
	},

    Ranged = {
		Head = 'Emperor Hairpin',
		Neck = 'Peacock Amulet',
		Ear1 = 'Drone Earring',
		Ear2 = 'Drone Earring',
		Body = 'Rapparee Harness',
		Hands = 'Noct Gloves +1',
		Ring1 = 'Scorpion Ring +1',
		Ring2 = 'Scorpion Ring +1',
		Back = 'Amemet Mantle +1',
		Legs = 'Bravo\'s Subligar',
		Feet = 'Custom F Boots',
	},
    Ranged_INT = {
		Ear1 = 'Omn. Earring',
		Ear2 = 'Drone Earring',
		Head = 'Rogue\'s Bonnet',
		Neck = 'Peacock Amulet',
		Body = 'Rapparee Harness',
		Hands = 'Noct Gloves +1',
		Ring1 = 'Scorpion Ring +1',
		Ring2 = 'Scorpion Ring +1',
		Back = 'Amemet Mantle +1',
		Legs = 'Bravo\'s Subligar',
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
	
	if (gData.GetBuffCount('Minuet') > 0) then
		gFunc.Equip('Ear2', 'Minuet Earring');
    end

    gcmelee.DoDefaultOverride()

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        gFunc.EquipSet(sets.SATA)
    elseif (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.SA)
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.TA)
    end
	if (player.Status == 'Idle' and player.HPP < 75 and conquest:GetOutsideControl()) then
        gFunc.Equip('Head', 'President. Hairpin')
    end
	if ((player.Status == 'Idle' or player.Status == 'Resting')) then
		if (environment.Time >= 6 and environment.Time < 18) then
			gFunc.Equip('Hands', 'Garden Bangles')
		end
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
