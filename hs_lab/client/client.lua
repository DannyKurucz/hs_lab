if cfg.esxLegacy == false then
    ESX = nil -- ESX 
    CreateThread(function()
	    while ESX == nil do
	    	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		    Wait(0)
	    end
    end)
end

RegisterNetEvent('esx:playerLoaded') -- toto načte postavu prostě základ
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local lab = true
local brick = false
local processing = false
local processing1 = false
local packet = true
local sell = true
CreateThread(function()
    
	while true do
    cas = 1000
	local playerPed = GetPlayerPed(-1)
    local Coords = GetEntityCoords(GetPlayerPed(-1))
    local pos = (cfg.zones["lab"])
	local dist = #(Coords - pos)
    if dist < 1 then
            if lab then
                lab = true
                if lab == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations['lab'], pos)
                    if dist < 1 then
                        if IsControlJustPressed(0, 38) then
                            lab = true
                            local playerPed = PlayerPedId()
                            SetPedComponentVariation(playerPed, 1, 38, 0, 2)                
                            RemoveBlip(blip)
                            lab = false
                            brick = true
                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)

CreateThread(function()
	while true do
    cas = 1000
	local playerPed = GetPlayerPed(-1)
    local Coords = GetEntityCoords(GetPlayerPed(-1))
    local pos = (cfg.zones["brick"])
	local dist = #(Coords - pos)
    if dist < 1 then
            if brick then
                brick = true
                if brick == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations['brick'], pos)
                    if dist < 1 then
                        if IsControlJustPressed(0, 38) then
                            brick = true
                            SetEntityHeading(playerPed, 166.4461)
                            TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                            Wait(5000)
                            ClearPedTasks(playerPed)
                            TriggerServerEvent("lab:brick")
                            processing = true
                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)

CreateThread(function()
	while true do
    cas = 1000
	local playerPed = GetPlayerPed(-1)
    local Coords = GetEntityCoords(GetPlayerPed(-1))
    local pos = (cfg.zones["processing"])
	local dist = #(Coords - pos)
    if dist < 1 then
            if processing then
                processing = true
                if processing == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations['processing'], pos)
                    if dist < 1 then
                        if IsControlJustPressed(0, 38) then
                            processing = true
                            SetEntityHeading(playerPed, 31.1440)
                            TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                            Wait(3000)
                            ClearPedTasks(playerPed)
                            TriggerServerEvent("lab:process")
                            processing1 = true

                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)

CreateThread(function()
	while true do
    cas = 1000
	local playerPed = GetPlayerPed(-1)
    local Coords = GetEntityCoords(GetPlayerPed(-1))
    local pos = (cfg.zones["processing1"])
	local dist = #(Coords - pos)
    if dist < 1 then
            if processing1 then
                processing1 = true
                if processing1 == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations['processing1'], pos)
                    if dist < 1 then
                        if IsControlJustPressed(0, 38) then
                            processing1 = true
                            SetEntityHeading(playerPed, 12.5262)
                            TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                            Wait(3000)
                            ClearPedTasks(playerPed)
                            TriggerServerEvent("lab:process1")

                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)

CreateThread(function()
	while true do
    cas = 1000
	local playerPed = GetPlayerPed(-1)
    local Coords = GetEntityCoords(GetPlayerPed(-1))
    local pos = (cfg.zones["packets"])
	local dist = #(Coords - pos)
    if dist < 1 then
            if packet then
                packet = true
                if packet == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations['packets'], pos)
                    if dist < 1 then
                        if IsControlJustPressed(0, 38) then
                            packet = true
                            SetEntityHeading(playerPed, 12.5437)
                            TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                            Wait(3000)
                            ClearPedTasks(playerPed)
                            TriggerServerEvent("lab:packets")

                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)

CreateThread(function()
	while true do
    cas = 1000
	local playerPed = GetPlayerPed(-1)
    local Coords = GetEntityCoords(GetPlayerPed(-1))
    local pos = (cfg.zones["sell"])
	local dist = #(Coords - pos)
    if dist < 1 then
            if sell then
                sell = true
                if sell == true then
                    cas = 5
                    ShowFloatingHelpNotification(cfg.translations['sell'], pos)
                    if dist < 1 then
                        if IsControlJustPressed(0, 38) then
                            sell = true
                            Wait(250)
                            TriggerServerEvent("lab:sell")

                        end
                    end
                end
            end
        end
        Wait(cas)
	end
end)









findlab = function()
    blip = AddBlipForCoord(cfg.blip['labposition'])
    AddTextEntry('MYBLIP585758', cfg.blip['findlabblipname'])
    SetBlipRoute(blip, true)
    BeginTextCommandSetBlipName('MYBLIP585758')
    EndTextCommandSetBlipName(blip)
    ESX.ShowNotification(cfg.translations['timeoutofdeleteblip'])
    SetTimeout(300000, function()
        ESX.ShowNotification(cfg.translations['timeoutdone'])
        RemoveBlip(blip)
    
    end)
    

end
finddealer = function()
    blip1 = AddBlipForCoord(cfg.blip['dealerposition'])
    AddTextEntry('MYBLIP585558', cfg.blip['dealerbblipname'])
    SetBlipRoute(blip1, true)
    BeginTextCommandSetBlipName('MYBLIP585558')
    EndTextCommandSetBlipName(blip1)
    ESX.ShowNotification(cfg.translations['timeoutusbgps'])
    SetTimeout(60000, function()
        ESX.ShowNotification(cfg.translations['timeoutdone'])
        RemoveBlip(blip1)
    
    end)
    

end

function mycb(success, timeremaining)
	if success then
		finddealer()
		TriggerEvent('mhacking:hide')
	else
		ESX.ShowNotification(cfg.translations["failure"])
		TriggerEvent('mhacking:hide')
	end
end


exports.qtarget:AddTargetModel({cfg.ped["pednameforqtarget"]}, {
	options = {
		{
			event = "lab:blip",
			icon = "fas fa-box-circle-check",
			label = cfg.translations['findlab'],
			num = 1
		},
	},
	distance = 2
})



RegisterNetEvent('lab:blip') 
AddEventHandler('lab:blip', function()
    findlab()
end)

RegisterNetEvent('lab:usb') 
AddEventHandler('lab:usb', function()
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start",7,35,mycb)
end)


ShowFloatingHelpNotification = function(msg, pos)
    AddTextEntry('text', msg)
    SetFloatingHelpTextWorldPosition(1, pos.x, pos.y, pos.z)
    SetFloatingHelpTextStyle(2, 1, 25, -1, 3, 0)
    BeginTextCommandDisplayHelp('text')
    EndTextCommandDisplayHelp(2, false, false, -1)
end

