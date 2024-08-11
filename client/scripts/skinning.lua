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

--- @section Constants

local SKINNING_ITEM <const> = 'weapon_knife'

--- @section Events

--- Handles skinning animals.
RegisterNetEvent('boii_hunting:cl:skin_animal', function()
    if is_skinning then notify(language.notify_header, language.already_skinning, 'error', 3500) return end
    local player_ped = PlayerPedId()
    local target_ped = utils.entities.get_target_ped(player_ped, 45.0, 2.0)
    local killer = GetPedSourceOfDeath(target_ped)
    if killer ~= player_ped then notify(language.notify_header, language.not_killer, 'error', 3500) return end
    local model_hash = GetEntityModel(target_ped)
    local animal_name = nil
    for name, data in pairs(config.animals) do
        if GetHashKey(name) == model_hash then
            animal_name = name
            break
        end
    end
    if not animal_name then debug_log('err', 'Event: skin_animal | Note: Invalid animal model or not found in config.') return end
    print('has_item check')
    utils.fw.has_item(SKINNING_ITEM, 1, function(has_item)
        print('has_item result', has_item)
        if not has_item then notify(language.notify_header, language.no_knife, 'error', 3500) return end
        is_skinning = true
        local timer = math.ceil(math.random(config.animals[animal_name].skinning_time.min, config.animals[animal_name].skinning_time.max))
        SendNUIMessage({
            action = 'start_timer',
            message = language.progress_text,
            duration = timer
        })
        utils.player.play_animation(player_ped, {
            dict = 'anim@gangops@facility@servers@bodysearch@',
            anim = 'player_search',
            flags = 1,
            duration = timer * 1000,
            freeze = true
        }, function()
            TriggerServerEvent('boii_hunting:sv:skin_animal', animal_name, NetworkGetNetworkIdFromEntity(target_ped))
            Wait(1000)
            is_skinning = false
        end)
    end)
end)

--- Deletes skinned animal for all clients.
RegisterNetEvent('boii_hunting:cl:delete_animal', function(network_id)
    local animal = NetworkGetEntityFromNetworkId(network_id)
    if DoesEntityExist(animal) then
        DeleteEntity(animal)
    end
end)
