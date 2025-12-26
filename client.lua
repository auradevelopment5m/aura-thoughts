local Config = require 'config'
local currentZone = nil
local currentThought = nil

local function AuraCheck(debugFunction, normalFunction)
    if Config.debug then
        return debugFunction()
    elseif normalFunction then
        return normalFunction()
    end
end

local function ShowThought(text, icon, duration, iconColor, borderColor)
    currentThought = { text = text, icon = icon, duration = duration, iconColor = iconColor, borderColor = borderColor }
    SendNUIMessage({
        type = 'showThought',
        text = text,
        icon = icon,
        duration = duration,
        iconColor = iconColor,
        borderColor = borderColor
    })

    AuraCheck(function()
        lib.print.debug(string.format("Showing thought: Text: %s, Icon: %s, Duration: %s, IconColor: %s, BorderColor: %s", text, icon, duration or "persistent", iconColor or "default", borderColor or "default"))
    end)
end

local function HideThought()
    currentThought = nil
    SendNUIMessage({
        type = 'hideThought'
    })

    AuraCheck(function()
        lib.print.debug("Hiding thought")
    end)
end

exports('ShowPersistentThought', function(text, icon, iconColor, borderColor)
    ShowThought(text, icon, nil, iconColor, borderColor)
end)

exports('ShowTemporaryThought', function(text, icon, duration, iconColor, borderColor)
    ShowThought(text, icon, duration, iconColor, borderColor)
end)

exports('HideThought', function()
    HideThought()
end)

local function GetRandomThought(thoughtArray)
    if #thoughtArray > 0 then
        local index = lib.math.random(1, #thoughtArray)
        return thoughtArray[index]
    else
        return "No thoughts available."
    end
end

local function CreateThoughtZone(zoneName, zoneConfig)
    if not zoneConfig.enabled then return end

    lib.zones.sphere({
        coords = zoneConfig.coords,
        radius = zoneConfig.radius,
        debug = Config.debug,
        onEnter = function()
            if currentZone ~= zoneName then
                currentZone = zoneName
                local thought = zoneConfig.randomThoughts and GetRandomThought(zoneConfig.thoughts) or zoneConfig.thoughts[1]
                if zoneConfig.type == "persistent" then
                    ShowThought(thought, zoneConfig.icon, nil, zoneConfig.iconColor, zoneConfig.borderColor)
                else
                    ShowThought(thought, zoneConfig.icon, zoneConfig.duration or 5000, zoneConfig.iconColor, zoneConfig.borderColor) -- Default to 5 seconds if duration not specified
                end
                
                AuraCheck(function()
                    lib.print.debug(zoneName .. " zone entered, thought displayed: " .. thought)
                end)
            end
        end,
        onExit = function()
            if currentZone == zoneName then
                currentZone = nil
                HideThought()
                
                AuraCheck(function()
                    lib.print.debug(zoneName .. " zone exited, thought hidden")
                end)
            end
        end
    })
    
    AuraCheck(function()
        lib.print.info(zoneName .. " zone created")
    end)
end

CreateThread(function()
    for zoneName, zoneConfig in pairs(Config.Zones) do
        CreateThoughtZone(zoneName, zoneConfig)
    end
end)

AuraCheck(function()
    local function getTableKeys(t)
        local keys = {}
        for k, _ in pairs(t) do
            table.insert(keys, k)
        end
        return keys
    end

    for zoneName, zoneConfig in pairs(Config.Zones) do
        local commandName = 'trigger'..zoneName..'thought'
        RegisterCommand(commandName, function()
            local thought = zoneConfig.randomThoughts and GetRandomThought(zoneConfig.thoughts) or zoneConfig.thoughts[1]
            ShowThought(thought, zoneConfig.icon, zoneConfig.duration, zoneConfig.iconColor, zoneConfig.borderColor)
            lib.print.debug("Test " .. zoneName .. " thought displayed: " .. thought)
        end, false)

        TriggerEvent('chat:addSuggestion', '/' .. commandName, 'Test thoughts for ' .. zoneName .. ' zone')
    end
    TriggerEvent('chat:addSuggestion', '/triggerthought', 'Test thoughts for a specific zone', {
        { name = "zoneName", help = "The name of the zone to test (e.g., Sewer, Airport, WhiteWidow, etc.)" }
    })
    RegisterCommand('triggerthought', function(source, args)
        if args[1] and Config.Zones[args[1]] then
            local zoneConfig = Config.Zones[args[1]]
            local thought = zoneConfig.randomThoughts and GetRandomThought(zoneConfig.thoughts) or zoneConfig.thoughts[1]
            ShowThought(thought, zoneConfig.icon, zoneConfig.duration, zoneConfig.iconColor, zoneConfig.borderColor)
            lib.print.debug("Test " .. args[1] .. " thought displayed: " .. thought)
        else
            lib.print.error("Invalid zone name. Available zones: " .. table.concat(getTableKeys(Config.Zones), ", "))
        end
    end, false)
end)