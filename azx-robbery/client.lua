local QBCore = exports['qb-core']:GetCoreObject()

local robberyHouseCoords = vector3(126.92, -1934.44, 21.38) 

exports['qb-target']:AddBoxZone("rob_house", robberyHouseCoords, 1.5, 1.5, {
    name = "rob_house",
    heading = 0,
    debugPoly = false,
    minZ = 20.0,
    maxZ = 23.0
}, {
    options = {
        {
            icon = "fas fa-door-open",
            label = "سرقة المنزل",
            action = function()
                TriggerServerEvent('qb-house:tryBreakIn')
            end,
            item = "lockpick"
        }
    },
    distance = 2.0
})

RegisterNetEvent('qb-house:startRobbery', function()
    DoScreenFadeOut(1000)
    Wait(1500)
    SetEntityCoords(PlayerPedId(), 266.36, -1007.15, -101.0)
    Wait(1000)
    DoScreenFadeIn(1000)
    QBCore.Functions.Notify("ابدأ في البحث عن الأشياء الثمينة!")
end)

RegisterNetEvent('qb-house:lootItem', function(item)
    TriggerServerEvent('qb-house:giveItem', item)
end)
