fx_version 'cerulean'
game 'gta5'

author 'qb'
description 'AZX DEV Team House robbery script for QBCore'
version '1.0.0'

shared_script '@qb-core/shared/locale.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependency 'qb-core'
dependency 'qb-target'
