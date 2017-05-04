return {
	admin = 250301329, -- Tu id reemplazando "250301329"

	bot_api_key = io.open("./data/key","r"):read(),
	log_chat = -1001101240169, --Envia la informacion y stats de los grupos
	channel = '@ModeradorTPYA_channel', --ingresa tu canal aquí
	languages = 'lenguajes.lua',
	-- Aquí puedes añadir más administradores globales terminando su id con ,
	owners = {
		250301329, --Admin1
		27840971, --Admin2
		76660884, --Admin3
},

	plugins = {
		"varios.lua",
		"click.lua",
		'onmessage.lua',
		'calculator.lua',
		'plugins.lua',
		'all.lua',
		'edit.lua',
		'uptime.lua',
		'gbanner.lua',
		'bash.lua',
		'error.lua',
		'caracola.lua',
		'antispam.lua',
		'spam.lua',
		'killer.lua',
		'saludador.lua',
		'say.lua',
		'sendfiles.lua',
		'compresor.lua',
		'sera.lua',
		'banhammer.lua',
		'mod.lua',
		'users.lua',
		'help.lua',
		'rules.lua',
		'settings.lua',
		'about.lua',
		'service.lua',
		'links.lua',
		'linkshelp.lua',
		'warn.lua',
		'extra.lua',
		'setlang.lua',
		'floodmanager.lua',
		'mediasettings.lua',
		'admin.lua',
		'faq.lua',
		'res.lua',
		'antibots.lua',
		'antigroseria.lua',
		'mension.lua',
		'linkg.lua',
		'cpgbanner.lua',
		'spamgbanner.lua',
		'statsg.lua',


	},

	available_languages = {
		'es'
	},
	chat_data = {
		'mod',
		'owner',
		'settings',
		'about',
		'rules',
		'flood',
		'extra',
		'reportblocked',
		'media',
		'banned',
		'welcome'
	},
}
