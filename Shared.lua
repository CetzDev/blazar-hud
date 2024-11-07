/* V1.1.0 */
Config = {}

Config.StatusUpdateInterval = 5000
Config.CommandHideHud = 'hud'
Config.timetomugshot = 10000

function GetStatus(cb)
    TriggerEvent("esx_status:getStatus", "hunger", function(h)
        TriggerEvent("esx_status:getStatus", "thirst", function(t)
            local hunger = h.getPercent()
            local thirst = t.getPercent()
            cb({hunger, thirst,})
        end)
    end)
end


Config.Commands = {
    -- Car Belt
    belt = 'carbelt',
    key = 'G',
}
