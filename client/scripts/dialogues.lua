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

local dialogues = dialogues or {}

dialogues.hunting = {
    header = {
        message = 'Welcome to the Hunting Store!',
        icon = 'fa-solid fa-bullseye'
    },
    conversation = {
        {
            id = 1,
            response = 'Hey there! Looking to gear up for your next hunt?',
            options = {
                {
                    icon = 'fa-solid fa-info-circle',
                    message = 'What kind of hunting gear do you have?',
                    next_id = 2,
                    should_end = false
                },
                {
                    icon = 'fa-solid fa-box-open',
                    message = 'Show me what hunting gear you have for sale.',
                    next_id = nil,
                    should_end = true,
                    action_type = 'server',
                    action = 'boii_hunting:sv:load_store',
                    params = {
                        store = 'hunting'
                    }
                },
                {
                    icon = 'fa-solid fa-door-open',
                    message = 'Just looking around for now, thanks!',
                    next_id = nil,
                    should_end = true
                }
            }
        },
        {
            id = 2,
            response = 'We offer a range of hunting essentials: rifles, ammunition, hunting knives, and bait. Whether youre hunting big game or small, we have the gear to get you ready for the wild!',
            options = {
                {
                    icon = 'fa-solid fa-arrow-left',
                    message = 'Back to previous questions.',
                    next_id = 1,
                    should_end = false
                },
                {
                    icon = 'fa-solid fa-box-open',
                    message = 'Let me see your hunting gear.',
                    next_id = nil,
                    should_end = true,
                    action_type = 'server',
                    action = 'boii_hunting:sv:load_store',
                    params = {
                        store = 'hunting'
                    }
                },
                {
                    icon = 'fa-solid fa-door-open',
                    message = 'Thanks, Ill take a look around.',
                    next_id = nil,
                    should_end = true
                }
            }
        },
    }
}

dialogues.meat = {
    header = {
        message = 'Meat Vendor',
        icon = 'fa-solid fa-drumstick-bite'
    },
    conversation = {
        {
            id = 1,
            response = 'Got some fresh meat for sale? Im always looking to buy.',
            options = {
                {
                    icon = 'fa-solid fa-info-circle',
                    message = 'What types of meat do you buy?',
                    next_id = 2,
                    should_end = false
                },
                {
                    icon = 'fa-solid fa-dollar-sign',
                    message = 'I want to sell some meat.',
                    next_id = nil,
                    should_end = true,
                    action_type = 'server',
                    action = 'boii_hunting:sv:sell_items',
                    params = {
                        store = 'meat'
                    }
                },
                {
                    icon = 'fa-solid fa-door-open',
                    message = 'Maybe next time!',
                    next_id = nil,
                    should_end = true
                }
            }
        },
        {
            id = 2,
            response = 'Im interested in all kinds of meat—deer, boar, rabbit, you name it. As long as its fresh, Ill buy it.',
            options = {
                {
                    icon = 'fa-solid fa-arrow-left',
                    message = 'Back to previous questions.',
                    next_id = 1,
                    should_end = false
                },
                {
                    icon = 'fa-solid fa-dollar-sign',
                    message = 'I want to sell some meat.',
                    next_id = nil,
                    should_end = true,
                    action_type = 'server',
                    action = 'boii_hunting:sv:sell_items',
                    params = {
                        store = 'meat'
                    }
                },
                {
                    icon = 'fa-solid fa-door-open',
                    message = 'Maybe next time!',
                    next_id = nil,
                    should_end = true
                }
            }
        },
    }
}

dialogues.hides = {
    header = {
        message = 'Hide Vendor',
        icon = 'fa-solid fa-paw'
    },
    conversation = {
        {
            id = 1,
            response = 'Looking to sell some quality hides? Im the one you want to talk to.',
            options = {
                {
                    icon = 'fa-solid fa-info-circle',
                    message = 'What kind of hides do you buy?',
                    next_id = 2,
                    should_end = false
                },
                {
                    icon = 'fa-solid fa-dollar-sign',
                    message = 'I want to sell some hides.',
                    next_id = nil,
                    should_end = true,
                    action_type = 'server',
                    action = 'boii_hunting:sv:sell_items',
                    params = {
                        store = 'hides'
                    }
                },
                {
                    icon = 'fa-solid fa-door-open',
                    message = 'Ill come back later.',
                    next_id = nil,
                    should_end = true
                }
            }
        },
        {
            id = 2,
            response = 'I buy all kinds of animal skins—deer, bear, even exotic hides if youve got them. Just make sure theyre in good condition.',
            options = {
                {
                    icon = 'fa-solid fa-arrow-left',
                    message = 'Back to previous questions.',
                    next_id = 1,
                    should_end = false
                },
                {
                    icon = 'fa-solid fa-dollar-sign',
                    message = 'I want to sell some hides.',
                    next_id = nil,
                    should_end = true,
                    action_type = 'server',
                    action = 'boii_hunting:sv:sell_items',
                    params = {
                        store = 'hides'
                    }
                },
                {
                    icon = 'fa-solid fa-door-open',
                    message = 'Ill come back later.',
                    next_id = nil,
                    should_end = true
                }
            }
        },
    }
}

dialogues.exotic = {
    header = {
        message = 'Exotic Vendor',
        icon = 'fa-solid fa-skull-crossbones'
    },
    conversation = {
        {
            id = 1,
            response = 'You got something a little more... rare? Im interested, but keep it quiet.',
            options = {
                {
                    icon = 'fa-solid fa-info-circle',
                    message = 'What kind of exotic goods are you buying?',
                    next_id = 2,
                    should_end = false
                },
                {
                    icon = 'fa-solid fa-dollar-sign',
                    message = 'Ive got some exotic items to sell.',
                    next_id = nil,
                    should_end = true,
                    action_type = 'server',
                    action = 'boii_hunting:sv:sell_items',
                    params = {
                        store = 'exotic'
                    }
                },
                {
                    icon = 'fa-solid fa-door-open',
                    message = 'Im not interested right now.',
                    next_id = nil,
                    should_end = true
                }
            }
        },
        {
            id = 2,
            response = 'I deal in items you dont see on the market—rare hides, illegal meats, and other exotic stuff. But remember, this stays between us.',
            options = {
                {
                    icon = 'fa-solid fa-arrow-left',
                    message = 'Back to previous questions.',
                    next_id = 1,
                    should_end = false
                },
                {
                    icon = 'fa-solid fa-dollar-sign',
                    message = 'Ive got some "rare" items to sell.',
                    next_id = nil,
                    should_end = true,
                    action_type = 'server',
                    action = 'boii_hunting:sv:sell_items',
                    params = {
                        store = 'exotic'
                    }
                },
                {
                    icon = 'fa-solid fa-door-open',
                    message = 'Im not interested right now.',
                    next_id = nil,
                    should_end = true
                }
            }
        },
    }
}

--- Event to launch dialogue based on store type.
RegisterNetEvent('boii_hunting:cl:start_conversation', function(data)
    local location = data.location
    local store_type = data.store
    if not is_store_open(store_type) then notify('Store Closed', 'This store is currently closed. Please come back during the opening hours.', 'info', 3500) return end

    local ped, coords = utils.entities.get_closest_ped(vector3(location.x, location.y, location.z), 5.0)
    local dialogue = dialogues[store_type]
    for _, convo in pairs(dialogue.conversation) do
        for _, option in pairs(convo.options) do
            if option.action ~= nil and option.action ~= '' then
                option.params = option.params or {}
                option.params.location = vector3(location.x, location.y, location.z)
            end
        end
    end
    exports.boii_ui:dialogue(dialogue, ped, coords)
end)