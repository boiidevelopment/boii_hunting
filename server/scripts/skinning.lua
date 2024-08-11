RegisterServerEvent('boii_hunting:sv:skin_animal')
AddEventHandler('boii_hunting:sv:skin_animal', function(animal_name, network_id)
    local _src = source
    local data = config.animals[animal_name]
    if not data then debug_log('err', 'Event: skin_animal | Note: Attempted to skin an invalid animal.') return end
    local animal_entity = NetworkGetEntityFromNetworkId(network_id)
    if not DoesEntityExist(animal_entity) then debug_log('err', 'Event: skin_animal | Note: Animal entity does not exist.') return end
    local animal_coords = GetEntityCoords(animal_entity)
    items = {}
    for _, item in ipairs(data.items) do
        local amount = math.ceil(math.random(item.min, item.max))
        items[#items + 1] = { item_id = item.item, action = 'add', quantity = amount }
    end
    utils.fw.adjust_inventory(_src, {
        items = items,
        validation_data = { location = animal_coords, distance = config.validation.distance, drop_player = config.validation.drop_player },
        note = 'Hunting: Skinning ' .. animal_name,
        should_save = true
    })
    notify(_src, language.notify_header, language.skinned_animal, 'success', 3500)
    TriggerClientEvent('boii_hunting:cl:delete_animal', -1, network_id)
end)