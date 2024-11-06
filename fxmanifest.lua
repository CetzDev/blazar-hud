fx_version 'cerulean'

game 'gta5'
lua54 'yes'
author 'CetzzzDev.'
description 'Redesign recreaone blazar hud'
version '1.0.0'

client_scripts {
    'Client/*.lua'
}


shared_scripts {
    '@ox_lib/init.lua',
    'Shared.lua'
}

ui_page {
    'html/index.html', 
}

files {
    'html/index.html',
    'html/app.js', 
    'html/style.css',
} 

escrow_ignore {
    'Shared.lua',
    'Client/Vehicle.lua',
    'Client/Client.lua',
    'Client/EsxDeclaration.lua'
}
