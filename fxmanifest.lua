fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name 'Aura'
author 'Aura Development'
description 'Simple Thoughts script to showcase thoughts in different zones!'
version '1.0.0'

ui_page 'web/index.html'

files {
    'web/index.html',
    'web/script.js',
    'web/styles.css',
    'web/fonts/geomotos_extrabold.otf'
}

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_script 'client.lua'

server_script 'server.lua'

exports {
    'ShowPersistentThought',
    'ShowTemporaryThought'
}

dependencies {
    'ox_lib'
}