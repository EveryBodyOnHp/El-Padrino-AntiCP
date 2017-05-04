--[[
Enviara a terminator a matar a usuario que le allas dicho que matara...
/n = Salto a la siguiente linea
Comentario solo para entender el lenguaje.
]]

local triggers = {
	'^[Mm]ata a (.*)$',
        '^& [Bb]ot mata a (.*)$'
}
local action = function(msg, matches, blocks, ln)
        api.sendMessage(msg.chat.id, '_Llamando a Terminator..._\n_Enviando datos ' ..matches[1]..'_...', true)
	api.sendDocument(msg.chat.id, './enviar/gif/giphy.mp4')
 
    end
    
 return {
	action = action,
	triggers = triggers
}
