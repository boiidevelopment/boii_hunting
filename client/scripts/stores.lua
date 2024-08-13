--[[
     ____   ____ _____ _____   _   _____  ________      ________ _      ____  _____  __  __ ______ _   _ _______ 
    |  _ \ / __ \_   _|_   _| | | |  __ \|  ____\ \    / /  ____| |    / __ \|  __ \|  \/  |  ____| \ | |__   __|
    | |_) | |  | || |   | |   | | | |  | | |__   \ \  / /| |__  | |   | |  | | |__) | \  / | |__  |  \| |  | |   
    |  _ <| |  | || |   | |   | | | |  | |  __|   \ \/ / |  __| | |   | |  | |  ___/| |\/| |  __| | . ` |  | |   
    | |_) | |__| || |_ _| |_  | | | |__| | |____   \  /  | |____| |___| |__| | |    | |  | | |____| |\  |  | |   
    |____/ \____/_____|_____| | | |_____/|______|   \/   |______|______\____/|_|    |_|  |_|______|_| \_|  |_|   
                              | |                                                                                
                              |_|                 HUNTING
]]

--- Opens the store UI.
--- @param data table: Data containing store information.
RegisterNetEvent('boii_hunting:cl:open_store', function(data)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open_store',
        data = data
    })
end)

--- Closes the UI and removes focus.
RegisterNUICallback('close_ui', function()
    SetNuiFocus(false, false)
end)

--- Requests store data from the server.
--- @param data table: Data containing store request information.
RegisterNetEvent('boii_hunting:cl:request_store', function(data)
    if not is_store_open(data.store) then notify('Store Closed', 'This store is currently closed. Please come back during the opening hours.', 'info', 3500) return end
    TriggerServerEvent('boii_hunting:sv:load_store', data)
end)


--- Handles store actions.
--- @param data table: Store action data.
RegisterNUICallback('handle_store_action', function(data)
    TriggerServerEvent('boii_hunting:sv:handle_store_action', data)
end)
