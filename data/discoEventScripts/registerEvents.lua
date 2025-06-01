--[[
An example of how to register events with the DiscoVerse engine.
Follow the instructions in xmlEventGeneration.lua.
]]
local mde = mods.multiverseDiscoEngine
local dvsd = mods.discoVerseStaticDefinitions
if not mde then
    error("Multiverse Disco Engine was not patched, or was patched after Disco Event Pack.  Install it properly or see crappy looking events.")
end

--You should make sure the event names you use for active checks are unique to your mod to avoid conflicts.

--It turns out the passive checks aren't actually supposed to go in choice blocks, they are supposed towell I guess I can do both.

local function appendEvents()
    local eventList = {}
    --EVENT CODE HERE V
    
    local crazyZoltan = mde.buildEvent("DROPPOINT_CRAZYZOLTAN")
    table.insert(crazyZoltan, mde.buildPassiveCheck(dvsd.s_empathy.internalName, 10, "mde_passive_1", "His words have power, but it is out of his control; they devour him even as he threatens you.  He will not be a threat for long."))
    table.insert(eventList, crazyZoltan)

    local distressZoltan = mde.buildEvent("DISTRESS_DROPPOINT_ZOLTAN")
    table.insert(distressZoltan, mde.buildActiveCheck(dvsd.s_interfacing.internalName, 12, "mde_active_1", "I can do this. How hard could alien energy shield repair be?",
            "DP_DISTRESS_DROPPOINT_ZOLTAN_SUCCESS", "DP_DISTRESS_DROPPOINT_ZOLTAN_FAILURE"))
    table.insert(eventList, distressZoltan)

    local distressZoltan2 = mde.buildEvent("DP_DISTRESS_DROPPOINT_ZOLTAN_SUCCESS")
    table.insert(distressZoltan2, mde.buildPassiveCheck(dvsd.s_electrochemistry.internalName, 11, "mde_passive_1", "'This ship wants _missiles_.'"))
    table.insert(eventList, distressZoltan2)

    local rockHeresy = mde.buildEvent("DYNASTY_ROCK_HERESY")
    table.insert(rockHeresy, mde.buildActiveCheck(dvsd.s_rhetoric.internalName, 14, "mde_active_1", "Heresy isn't all bad.",
            "DP_DYNASTY_ROCK_HERESY_SUCCESS", "DP_DYNASTY_ROCK_HERESY_FAILURE"))
    table.insert(eventList, rockHeresy)


    local dynastyFilth = mde.buildEvent("NEBULA_DYNASTY_FILTH")
    table.insert(dynastyFilth, mde.buildPassiveCheck(dvsd.s_shivers.internalName, 10, "mde_passive_1", "This place is *wrong*."))
    table.insert(eventList, dynastyFilth)

    local dynastyFilthOptions = mde.buildEvent("DP_NEBULA_DYNASTY_FILTH_OPTIONS")
    table.insert(dynastyFilthOptions, mde.buildPassiveCheck(dvsd.s_espirit_de_corps.internalName, 9, "mde_passive_1", "With fire."))
    table.insert(dynastyFilthOptions, mde.buildPassiveCheck(dvsd.s_inland_empire.internalName, 8, "mde_passive_2", "The filth must be contained.  Your ship can be its vessel.  You must.  You are the only hope this sordid sector has of ever being clean."))
    table.insert(eventList, dynastyFilthOptions)

    --EVENT CODE HERE ^
    mde.registerEventList(eventList)
end
appendEvents()