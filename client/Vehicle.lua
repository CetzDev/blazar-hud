local Comandos = Config.Commands

CreateThread(function ()
	while true do
        ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            _sleep = 3
            if cinturon then 
                DisableControlAction(0, 75, true)  -- Disable exit vehicle when stop
                DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
            end
        else
            _sleep = 1000
        end
        Wait(_sleep)
	end
end)

CreateThread(function ()
    while true do 
        ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            
            _sleep = 100
            local vehiculo = GetVehiclePedIsUsing(ped)
            local velo = (GetEntitySpeed(vehiculo)* 3.6)
            local gaso = GetVehicleFuelLevel(vehiculo)
            local carhealth = GetVehicleBodyHealth(vehiculo)/10

            SendNUIMessage({
                action = 'showCarhud',
                vel = velo,
                gasolina = gaso,
                carhealth = carhealth,
                cinturon = cinturon
            })
        else
            _sleep = 1000
            SendNUIMessage({
                action = 'hideCarhud'
            })

        end
        Wait(_sleep)
    end
end)

RegisterCommand(Comandos['belt'], function()
    local jugador = PlayerPedId()
    if IsPedInAnyVehicle(jugador) then
        if cinturon then 
            -- lib.progressBar ({
            --     duration = 800,
            --     label = 'Desabrochando cinturon',
            --     useWhileDead = false
            -- })
            -- Wait(800)
            PlaySoundFrontend(-1, "Faster_Click", "RESPAWN_ONLINE_SOUNDSET", 1)
            ESX.ShowNotification('Cinturon <span style="color: red;">desabrochado</span>')
            cinturon = false
        else
            -- lib.progressBar ({
            --     duration = 800,
            --     label = 'Abrochando cinturon',
            --     useWhileDead = false
            -- })
            -- Wait(800)
            PlaySoundFrontend(-1, "Faster_Click", "RESPAWN_ONLINE_SOUNDSET", 1)
            ESX.ShowNotification('Cinturon <span style="color: green;">abrochado</span>')
            cinturon = true
        end
    end
end)

RegisterNUICallback('exit', function(data, cb)
  SetNuiFocus(false, false)
  PanelOpen = false

end)

RegisterKeyMapping(Comandos['belt'], 'Car Belt', 'keyboard', Comandos['key'])