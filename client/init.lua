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

--- Import utility library
utils = exports.boii_utils:get_utils()

--- @section Constants

local TARGET_RESOURCE = GetResourceState('boii_target') == 'started' and 'boii_target' or GetResourceState('ox_target') == 'started' and 'ox_target' or GetResourceState('qb-target') == 'started' and 'qb-target' or nil
local STORE_EVENT = GetResourceState('boii_ui') == 'started' and 'boii_hunting:cl:start_conversation' or 'boii_hunting:cl:request_store'

--- @section Global vars

is_skinning = false

--- @section Global functions

--- Handles debug logging.
--- @param type string: The type of debug message.
--- @param message string: The debug message.
function debug_log(type, message)
    if config.debug and utils.debug[type] then utils.debug[type](message) end
end

--- Send notifications.
--- @param _src number: The source player ID.
--- @param header string: Notification header.
--- @param message string: Notification message.
--- @param type string: Notification type.
--- @param duration number: Notification duration in ms.
function notify(header, message, type, duration)
    utils.ui.notify({ header = header, message = message, type = type, duration = duration })
end

--- @section Local functions

function is_store_open(store_type)
    local current_hour = GetClockHours()
    local store_data = config.stores[store_type]
    for _, location in ipairs(store_data.locations) do
        if not location.opening_times then return true end
        if current_hour >= location.opening_times.open and current_hour < location.opening_times.close then
            return true
        end
    end
    return false
end

--- Sets up interaction zones for targets based on configured methods.
--- @function script_setup
local function script_setup(client_config)
    for store_type, store_data in pairs(client_config.stores) do
        local blip_template = store_data.blip
        local ped_template = store_data.ped
        for _, location in pairs(store_data.locations) do
            if location.show_blip then
                utils.blips.create_blip({
                    coords = vector3(location.coords.x, location.coords.y, location.coords.z),
                    sprite = blip_template.sprite,
                    colour = blip_template.colour,
                    scale = blip_template.scale,
                    label = blip_template.label,
                    category = blip_template.category,
                    show = true
                })
            end
            local ped_data = {
                base_data = {
                    id = location.id,
                    model = ped_template.model,
                    coords = location.coords,
                    scenario = ped_template.scenario,
                    category = ped_template.category,
                    networked = ped_template.networked
                }
            }
            local created_ped = utils.peds.create_ped(ped_data)
            local zone_id = 'zone_' .. location.id .. '_ ' .. store_type
            
            if TARGET_RESOURCE == 'boii_target' then
                exports.boii_target:add_entity_zone({ created_ped }, {
                    id = zone_id,
                    icon = 'fa-solid fa-comments',
                    distance = ped_template.distance or 2.0,
                    debug = client_config.debug,
                    actions = {
                        {
                            label = ped_template.label, 
                            icon = 'fa-solid fa-comments',
                            colour = '#4dcbc2',
                            action_type = 'function',
                            action = function()
                                TriggerEvent(STORE_EVENT, { location = location.coords, store = store_type })
                            end
                        }
                    }
                })
            end
            
            if TARGET_RESOURCE == 'ox_target' then
                exports.ox_target:addLocalEntity(created_ped, {
                    name = zone_id,
                    label = ped_template.label,
                    distance = ped_template.distance or 2.0,
                    onSelect = function()
                        TriggerEvent(STORE_EVENT, { location = location.coords, store = store_type })
                    end
                })
            end
            
            if TARGET_RESOURCE == 'qb-target' then
                exports['qb-target']:AddEntityZone(zone_id, created_ped, {
                    name = zone_id,
                    heading = location.coords.w,
                    debugPoly = client_config.debug,
                }, {
                    distance = ped_template.distance or 2.0,
                    options = {
                        {
                            label = ped_template.label,
                            icon = 'fa-solid fa-comments',
                            action = function()
                                TriggerEvent(STORE_EVENT, { location = location.coords, store = store_type })
                            end
                        }
                    }
                })
            end
        end
    end
    local animal_models = {}
    for animal, _ in pairs(client_config.animals) do
        animal_models[#animal_models + 1] = animal
    end
    if TARGET_RESOURCE == 'boii_target' then
        exports.boii_target:add_model(animal_models, {
            id = 'hunting_skinning',
            icon = 'fa-solid fa-paw',
            distance = 2.0,
            actions = {
                {
                    icon = 'fa-solid fa-paw',
                    label = 'Skin Animal',
                    colour = 'red',
                    action_type = 'function',
                    action = function()
                        TriggerEvent('boii_hunting:cl:skin_animal')
                    end,
                    can_interact = function(entity)
                        return (GetPedType(entity) == 28 and IsEntityDead(entity)) and not IsPedAPlayer(entity)
                    end
                },
            },
        })
    end
    if TARGET_RESOURCE == 'ox_target' then
        exports.ox_target:addGlobalPed({
            name = 'hunting_skinning',
            icon = 'fa-solid fa-paw',
            label = 'Skin Animal',
            distance = 2.0,
            canInteract = function(entity)
                return (GetPedType(entity) == 28 and IsEntityDead(entity)) and not IsPedAPlayer(entity)
            end,
            onSelect = function()
                TriggerEvent('boii_hunting:cl:skin_animal')
            end
        })
    end
    if TARGET_RESOURCE == 'qb-target' then
        for _, animal in ipairs(animal_models) do
            exports['qb-target']:AddTargetModel(animal, {
                options = {
                    {
                        icon = 'fa-solid fa-paw',
                        label = 'Skin Animal',
                        action = function()
                            TriggerEvent('boii_hunting:cl:skin_animal')
                        end,
                        canInteract = function(entity)
                            return (GetPedType(entity) == 28 and IsEntityDead(entity)) and not IsPedAPlayer(entity)
                        end,
                    }
                },
                distance = 2.0
            })
        end
    end
end

--- @section Callbacks

--- Fetches and sets up target zones upon callback.
--- @param client_config table: The config data received from the server.
utils.callback.cb('boii_hunting:sv:request_config', {}, function(client_config)
    config = client_config
    script_setup(client_config)
end)

--- Resource clean up.
AddEventHandler('onResourceStop', function(res)
    if GetCurrentResourceName() ~= res then
        return
    end
    utils.blips.remove_blips_by_categories({'boii_hunting'})
    utils.peds.remove_peds_by_categories({'boii_hunting'})
end)
