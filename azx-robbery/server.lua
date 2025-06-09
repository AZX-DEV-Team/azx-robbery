local QBCore = exports['qb-core']:GetCoreObject()


local function isNightTime()
    local hour = tonumber(os.date("%H"))
    return hour >= 20 or hour <= 5
end

RegisterServerEvent('qb-house:tryBreakIn', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not isNightTime() then
        TriggerClientEvent('QBCore:Notify', src, ' يمكنك السرقة فقط في الليل!', 'error')
        return
    end

    if not Player.Functions.GetItemByName('lockpick') then
        TriggerClientEvent('QBCore:Notify', src, ' تحتاج Lockpick!', 'error')
        return
    end

    if not Player.Functions.GetItemByName('housekey') then
        TriggerClientEvent('QBCore:Notify', src, ' تحتاج مفتاح المنزل!', 'error')
        return
    end

    TriggerClientEvent('qb-house:startRobbery', src)
end)

RegisterServerEvent('qb-house:giveItem', function(item)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem(item, 1)
end)
