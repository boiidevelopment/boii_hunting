-- Import utility library
utils = exports.boii_utils:get_utils()

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
function notify(_src, header, message, type, duration)
    utils.ui.notify(_src, { header = header, message = message, type = type, duration = duration })
end

--- @section Local functions

local function filter_animals()
    local animals = {}
    for name, data in pairs(config.animals) do
        animals[name] = {
            skinning_time = data.skinning_time
        }
    end
    return animals
end

--- @section Callbacks

--- Server callback to provide config sections to client.
--- @param _src number: The players server ID requesting the data.
--- @param data table: Unused parameter for consistency with callback pattern.
--- @param cb function: Callback function to return.
utils.callback.register('boii_hunting:sv:request_config', function(_src, data, cb)
    cb({ debug = config.debug, stores = config.stores, animals = filter_animals() })
end)