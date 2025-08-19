RegisterNetEvent('ammoSync:forceUpdate', function(weapon, ammo)
    local ped = PlayerPedId()
    if GetSelectedPedWeapon(ped) == weapon then
        SetPedAmmo(ped, weapon, ammo)
    end
end)

AddEventHandler('gameEventTriggered', function(event, data)
    if event == "CEventGunShot" then
        local ped = PlayerPedId()
        if data[1] == ped then
            local weapon = GetSelectedPedWeapon(ped)
            local ammo = GetAmmoInPedWeapon(ped, weapon)

            TriggerServerEvent('ammoSync:updateAmmo', weapon, ammo)
        end
    end
end)
