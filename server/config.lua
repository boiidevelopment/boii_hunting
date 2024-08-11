config = config or {}

config.debug = false

config.validation = {
    distance = 10.0, --- Maximum distance allowed from stores to buy or sell.
    drop_player = true --- Toggle if a player should be dropped if trying to buy or sell from outside the distance.
}

config.stores = {
    hunting = {
        mode = 'buy',
        blip = { type = 'hunting', label = 'Hunting Store', category = 'boii_hunting', sprite = 141, colour = 0, scale = 0.6 },
        ped = { type = 'hunting', label = 'Shop Keeper', model = 'mp_m_exarmy_01', scenario = 'WORLD_HUMAN_CLIPBOARD', category = 'boii_hunting', networked = false, distance = 2.0 },
        locations = {
            { id = 'paleto_forest', coords = vector4(-773.26, 5597.76, 33.61, 174.37), show_blip = true, opening_times = { open = 10, close = 18} },
            --- Add more hunting store locations here..
        },
        items = {
            water = { id = 'water', label = 'Water', image = 'water.png', price = 3, categories = { 'consumables' } },
            burger = { id = 'burger', label = 'Burger', image = 'burger.png', price = 5, categories = { 'consumables' } },
            weapon_knife = { id = 'weapon_knife', label = 'Knife', image = 'weapon_knife.png', price = 100, categories = { 'melee' } },
            weapon_pistol = { id = 'weapon_pistol', label = 'Pistol', image = 'weapon_pistol.png', price = 100, categories = { 'pistols' } },
            weapon_sniperrifle = { id = 'weapon_sniperrifle', label = 'Sniper Rifle', image = 'weapon_sniperrifle.png', price = 5000, categories = { 'rifles' } },
            pistol_ammo = { id = 'pistol_ammo', label = 'Pistol Ammo', image = 'ammo_pistol.png', price = 100, categories = { 'ammo' } },
            snp_ammo = { id = 'snp_ammo', label = 'Sniper Ammo', image = 'ammo_sniper.png', price = 200, categories = { 'ammo' } }
            --- Add more hunting store items here..
        }
    },
    meat = {
        mode = 'sell',
        blip = { type = 'meat', label = 'Meat Buyer', category = 'boii_hunting', sprite = 141, colour = 0, scale = 0.6 },
        ped = { type = 'meat', label = 'Chef', model = 's_m_m_linecook', scenario = 'WORLD_HUMAN_CLIPBOARD', category = 'boii_hunting', networked = false, distance = 2.0 },
        locations = {
            { id = 'forum_drive', coords = vector4(-42.38, -1473.82, 31.81, 4.12), show_blip = true, opening_times = { open = 10, close = 18} },
            --- Add more meat store locations here..
        },
        items = {
            meat_boar = { id = 'meat_boar', label = 'Boar Meat', image = 'meat_boar.png', price = 10, categories = { 'meat' } },
            meat_coyote = { id = 'meat_coyote', label = 'Coyote Meat', image = 'meat_coyote.png', price = 8, categories = { 'meat' } },
            meat_deer = { id = 'meat_deer', label = 'Deer Meat', image = 'meat_deer.png', price = 12, categories = { 'meat' } },
            meat_mtlion = { id = 'meat_mtlion', label = 'Mt Lion Meat', image = 'meat_mtlion.png', price = 15, categories = { 'meat' } },
            meat_rabbit = { id = 'meat_rabbit', label = 'Rabbit Meat', image = 'meat_rabbit.png', price = 5, categories = { 'meat' } },
            meat_cow = { id = 'meat_cow', label = 'Cow Meat', image = 'meat_cow.png', price = 15, categories = { 'meat' } },
            meat_rat = { id = 'meat_rat', label = 'Rat Meat', image = 'meat_rat.png', price = 3, categories = { 'meat' } },
            meat_chicken = { id = 'meat_chicken', label = 'Chicken Meat', image = 'meat_chicken.png', price = 6, categories = { 'meat' } },
            --- Add more non-exotic meat items here..
        }
    },
    hides = {
        mode = 'sell',
        blip = { type = 'hides', label = 'Hide Buyer', category = 'boii_hunting', sprite = 141, colour = 0, scale = 0.6 },
        ped = { type = 'hides', label = 'Textiles Dealer', model = 's_m_m_linecook', scenario = 'WORLD_HUMAN_CLIPBOARD', category = 'boii_hunting', networked = false, distance = 2.0 },
        locations = {
            { id = 'textile_city', coords = vector4(464.65, -786.75, 27.36, 93.47), show_blip = true, opening_times = { open = 10, close = 18} },
            --- Add more hides store locations here..
        },
        items = {
            hide_boar = { id = 'hide_boar', label = 'Boar Hide', image = 'hide_boar.png', price = 20, categories = { 'hide' } },
            hide_coyote = { id = 'hide_coyote', label = 'Coyote Hide', image = 'hide_coyote.png', price = 18, categories = { 'hide' } },
            hide_deer = { id = 'hide_deer', label = 'Deer Hide', image = 'hide_deer.png', price = 25, categories = { 'hide' } },
            hide_mtlion = { id = 'hide_mtlion', label = 'Mt Lion Hide', image = 'hide_mtlion.png', price = 30, categories = { 'hide' } },
            hide_rabbit = { id = 'hide_rabbit', label = 'Rabbit Hide', image = 'hide_rabbit.png', price = 10, categories = { 'hide' } },
            hide_cow = { id = 'hide_cow', label = 'Cow Hide', image = 'hide_cow.png', price = 25, categories = { 'hide' } },
            hide_rat = { id = 'hide_rat', label = 'Rat Hide', image = 'hide_rat.png', price = 8, categories = { 'hide' } },
            --- Add more non-exotic hide items here..
        }
    },
    exotic = {
        mode = 'sell',
        blip = { type = 'exotic', label = 'Exotic Dealer', category = 'boii_hunting', sprite = 141, colour = 1, scale = 0.6 },
        ped = { type = 'exotic', label = 'Suspicious Person', model = 'ig_gustavo', scenario = 'WORLD_HUMAN_SMOKING', category = 'boii_hunting', networked = false, distance = 2.0 },
        locations = {
            { id = 'paleto_forest', coords = vector4(1159.22, -1374.77, 34.72, 273.25), show_blip = true, opening_times = { open = 10, close = 18} },
            --- Add more exotic dealer locations here..
        },
        items = {
            hide_shark = { id = 'hide_shark', label = 'Shark Hide', image = 'hide_shark.png', price = 50, categories = { 'exotic' } },
            meat_shark = { id = 'meat_shark', label = 'Shark Meat', image = 'meat_shark.png', price = 40, categories = { 'exotic' } },
            hide_whale = { id = 'hide_whale', label = 'Whale Hide', image = 'hide_whale.png', price = 80, categories = { 'exotic' } },
            meat_whale = { id = 'meat_whale', label = 'Whale Meat', image = 'meat_whale.png', price = 70, categories = { 'exotic' } },
            hide_dolphin = { id = 'hide_dolphin', label = 'Dolphin Hide', image = 'hide_dolphin.png', price = 60, categories = { 'exotic' } },
            meat_dolphin = { id = 'meat_dolphin', label = 'Dolphin Meat', image = 'meat_dolphin.png', price = 50, categories = { 'exotic' } },
            hide_stingray = { id = 'hide_stingray', label = 'Stingray Hide', image = 'hide_stingray.png', price = 45, categories = { 'exotic' } },
            meat_stingray = { id = 'meat_stingray', label = 'Stingray Meat', image = 'meat_stingray.png', price = 35, categories = { 'exotic' } },
            meat_chickenhawk = { id = 'meat_chickenhawk', label = 'Chickenhawk Meat', image = 'meat_chickenhawk.png', price = 30, categories = { 'exotic' } },
            meat_cormorant = { id = 'meat_cormorant', label = 'Cormorant Meat', image = 'meat_cormorant.png', price = 25, categories = { 'exotic' } },
            --- Add more exotic items here..
        }
    }
}

config.animals = {
    a_c_sharkhammer = { 
        exotic = true,
        skinning_time = { min = 10, max = 20 },
        items = { 
            { item = 'hide_shark', min = 1, max = 6 }, 
            { item = 'meat_shark', min = 1, max = 3 } 
        } 
    },
    a_c_sharktiger = { 
        exotic = true,
        skinning_time = { min = 10, max = 20 }, 
        items = { 
            { item = 'hide_shark', min = 1, max = 6 }, 
            { item = 'meat_shark', min = 1, max = 3 } 
        } 
    },
    a_c_killerwhale = {
        exotic = true,
        skinning_time = { min = 15, max = 30 }, 
        items = { 
            { item = 'hide_whale', min = 1, max = 8 }, 
            { item = 'meat_whale', min = 1, max = 8 } 
        } 
    },
    a_c_humpback = {
        exotic = true,
        skinning_time = { min = 15, max = 30 }, 
        items = { 
            { item = 'hide_whale', min = 1, max = 11 }, 
            { item = 'meat_whale', min = 1, max = 11 } 
        } 
    },
    a_c_dolphin = {
        exotic = true, 
        skinning_time = { min = 10, max = 20 }, 
        items = { 
            { item = 'hide_dolphin', min = 1, max = 2 }, 
            { item = 'meat_dolphin', min = 1, max = 2 } 
        } 
    },
    a_c_stingray = { 
        skinning_time = { min = 8, max = 15 }, 
        items = { 
            { item = 'hide_stingray', min = 1, max = 5 }, 
            { item = 'meat_stingray', min = 1, max = 3 } 
        } 
    },
    a_c_boar = { 
        skinning_time = { min = 7, max = 15 }, 
        items = { 
            { item = 'hide_boar', min = 1, max = 5 }, 
            { item = 'meat_boar', min = 1, max = 3 }
        } 
    },
    a_c_chickenhawk = { 
        exotic = true, 
        skinning_time = { min = 5, max = 10 }, 
        items = { 
            { item = 'meat_chickenhawk', min = 1, max = 3 } 
        } 
    },
    a_c_cormorant = {
        exotic = true, 
        skinning_time = { min = 6, max = 12 }, 
        items = { 
            { item = 'meat_cormorant', min = 1, max = 3 } 
        } 
    },
    a_c_hen = { 
        skinning_time = { min = 5, max = 9 }, 
        items = { 
            { item = 'meat_chicken', min = 1, max = 3 } 
        } 
    },
    a_c_coyote = { 
        skinning_time = { min = 7, max = 15 }, 
        items = { 
            { item = 'hide_coyote', min = 1, max = 3 }, 
            { item = 'meat_coyote', min = 1, max = 2 } 
        } 
    },
    a_c_deer = { 
        skinning_time = { min = 7, max = 11 }, 
        items = { 
            { item = 'hide_deer', min = 1, max = 3 }, 
            { item = 'meat_deer', min = 1, max = 3 } 
        } 
    },
    a_c_mtlion = { 
        skinning_time = { min = 10, max = 18 }, 
        items = { 
            { item = 'hide_mtlion', min = 1, max = 2 }, 
            { item = 'meat_mtlion', min = 1, max = 3 } 
        } 
    },
    a_c_rabbit_01 = { 
        skinning_time = { min = 4, max = 7 }, 
        items = { 
            { item = 'hide_rabbit', min = 1, max = 1 }, 
            { item = 'meat_rabbit', min = 1, max = 3 } 
        } 
    },
    a_c_cow = { 
        skinning_time = { min = 6, max = 11 }, 
        items = { 
            { item = 'hide_cow', min = 1, max = 3 }, 
            { item = 'meat_cow', min = 1, max = 3 } 
        } 
    },
    a_c_rat = { 
        skinning_time = { min = 5, max = 9 }, 
        items = { 
            { item = 'hide_rat', min = 1, max = 1 }, 
            { item = 'meat_rat', min = 1, max = 2 } 
        } 
    }
}

