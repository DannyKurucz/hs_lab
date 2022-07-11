if cfg.esxLegacy == false then
    ESX = nil
    TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
end

ESX.RegisterUsableItem(cfg.usb["usb"], function(source)

    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem(cfg.usb["usb"], 1)
    TriggerClientEvent('lab:usb', source)

end)


RegisterNetEvent("lab:brick")
AddEventHandler("lab:brick", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.canCarryItem(cfg.brick["cokebrick"], 1) then
        xPlayer.addInventoryItem(cfg.brick["cokebrick"], 1)
    else
        TriggerClientEvent('esx:showNotification', source, cfg.translations['limit'])
    end
end)
RegisterNetEvent("lab:packets")
AddEventHandler("lab:packets", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.canCarryItem(cfg.packets["packets"], 1) then
        xPlayer.addInventoryItem(cfg.packets["packets"], 1)
    else
        TriggerClientEvent('esx:showNotification', source, cfg.translations['limit'])
    end
end)

RegisterNetEvent("lab:process")
AddEventHandler("lab:process", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local randomMoney = math.random(5,10)
    if xPlayer.getInventoryItem(cfg.process["cokebrick"]).count > 0 then
        xPlayer.addInventoryItem(cfg.process["coke"], randomMoney)
        xPlayer.removeInventoryItem(cfg.process["cokebrick"], 1)        
    else
        TriggerClientEvent('esx:showNotification', source, cfg.translations['nobrick'])
    end
end)

RegisterNetEvent("lab:process1")
AddEventHandler("lab:process1", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem(cfg.finalprocess["coke"]).count > 0 and xPlayer.getInventoryItem(cfg.finalprocess["packets"]).count > 0 then
        xPlayer.addInventoryItem(cfg.finalprocess["cokebag"], 1)
        xPlayer.removeInventoryItem(cfg.finalprocess["coke"], 1)  
        xPlayer.removeInventoryItem(cfg.finalprocess["packets"], 1)  

    else
        TriggerClientEvent('esx:showNotification', source, cfg.translations['nobag'])
    end
end)
local maxmoney = 1100

RegisterNetEvent("lab:sell")
AddEventHandler("lab:sell", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local money = 1000
    if xPlayer ~= nil then
        if money >= maxmoney then
            xPlayer.kick("Cheater")
        else
            local randomMoney = math.random(300,600)
            if xPlayer.getInventoryItem(cfg.selling["cokebag"]).count > 0 then
                xPlayer.addInventoryItem("black_money", randomMoney)
                xPlayer.removeInventoryItem(cfg.selling["cokebag"], 1)
                
            else
                TriggerClientEvent('esx:showNotification', source, cfg.translations['nocoke'])
            end
        end
    end
end)
