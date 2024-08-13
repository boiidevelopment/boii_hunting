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

fx_version 'cerulean'
games { 'gta5', 'rdr3' }

name 'boii_hunting'
version '1.0.1'
description 'BOII | Development - Hunting'
author 'boiidevelopment'
repository 'https://github.com/boiidevelopment/boii_hunting'
lua54 'yes'

ui_page 'public/index.html'

files {
    'public/**/**/**/**',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/config.lua',
    'server/init.lua',
    'server/scripts/*'
}

client_scripts {
    'client/init.lua',
    'client/scripts/*'
}

shared_scripts {
    'shared/language/en.lua',
    'shared/data/*'
}

escrow_ignore {
    'shared/**/*',
    'client/**/*',
    'server/**/*'
}
