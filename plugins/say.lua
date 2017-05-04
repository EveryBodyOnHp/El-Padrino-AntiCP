local action = function(msg, matches, ln)
	api.sendMessage(msg.chat.id, make_text '' ..matches[1].. ' _Nota; Comando say sera eliminado por reportes de usuarios_', true)
	mystat('/say')
end

return {
	action = action,
	triggers = {
		'^/[SS]ay (.*)$',
		'^/di (.*)$'
	}
}
