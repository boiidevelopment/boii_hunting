--- @section Events

--- Load store data.
RegisterServerEvent('boii_hunting:sv:load_store', function(data)
    if not data.store then debug_log('err', language.missing_store) return end
    local _src = source 
    local store_data = {
        type = data.store,
        name = config.stores[data.store].blip.label,
        items = config.stores[data.store].items,
        mode = config.stores[data.store].mode
    }
    TriggerClientEvent('boii_hunting:cl:open_store', _src, store_data)
end)

RegisterServerEvent('boii_hunting:sv:handle_store_action', function(data)
    local _src, store_data = source, config.stores[data.store_id]
    if not store_data then return debug_log('err', language.invalid_store_id) end
    local is_buying, player_coords = store_data.mode == 'buy', GetEntityCoords(GetPlayerPed(_src))
    local is_near_store, store_location = false, nil
    for _, location in ipairs(store_data.locations) do
        if #(player_coords - vector3(location.coords.x, location.coords.y, location.coords.z)) <= 10.0 then
            is_near_store, store_location = true, vector3(location.coords.x, location.coords.y, location.coords.z)
            break
        end
    end
    if not is_near_store then return debug_log('err', language.too_far_from_store) end
    local item_data = store_data.items[data.item]
    if not item_data then return debug_log('err', string.format(language.invalid_item, data.item)) end
    local quantity = item_data.price * (tonumber(data.quantity) or 1)
    if is_buying and utils.fw.get_balance_by_type(_src, 'cash') < quantity then notify(_src, language.notify_header, string.format(language.cant_afford, quantity), 'error', 3500) return end
    if not is_buying and utils.fw.has_item(data.item, quantity) then notify(_src, language.notify_header, string.format(language.sale_failed, item_data.label), 'error', 3500) return end
    utils.fw.adjust_balance(_src, {
        operations = { { balance_type = 'cash', action = is_buying and 'remove' or 'add', amount = quantity } },
        validation_data = { location = store_location, distance = config.validation.distance, drop_player = config.validation.drop_player },
        reason = (is_buying and 'Purchasing ' or 'Selling ') .. item_data.label .. (is_buying and ' from ' or ' to ') .. data.store_id,
        should_save = true
    })
    utils.fw.adjust_inventory(_src, {
        items = { { item_id = data.item, action = is_buying and 'add' or 'remove', quantity = tonumber(data.quantity) or 1 } },
        validation_data = { location = store_location, distance = config.validation.distance, drop_player = config.validation.drop_player },
        note = (is_buying and 'Hunting: Purchase of ' or 'Hunting: Sale of ') .. item_data.label,
        should_save = true
    })
    notify(_src, language.notify_header, string.format(is_buying and language.purchase_success or language.sale_success, quantity, item_data.label .. ' x' .. (tonumber(data.quantity) or 1)), 'success', 3500)
end)