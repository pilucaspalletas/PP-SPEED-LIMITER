Citizen.CreateThread(function()
    local speedLimit = 250.0 / 3.6
    local hasNotified = false

    while true do
        Citizen.Wait(0)

        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local speed = GetEntitySpeed(vehicle)

            if speed > speedLimit then
                SetVehicleForwardSpeed(vehicle, speedLimit)
                local force = (speed - speedLimit) * -1.0
                ApplyForceToEntity(vehicle, 1, 0.0, force, 0.0, 0.0, 0.0, 0.0, true, true, true, false, true, true)

                if not hasNotified then
                    TriggerEvent('esx:showNotification', 'Has alcanzado los 250 km/h las ruedas estan empezando a fallar')
                    hasNotified = true
                end
            end
        else
            hasNotified = false
        end
    end
end)
