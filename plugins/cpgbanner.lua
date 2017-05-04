local function grep_reply(msg)
		local action = io.popen('grep -rn "'..msg.reply.from.id..'" ./data/cp.lua')
		local read = action:read("*a")
		return read
end

local function grep_matches(msg, matches)
		local action = io.popen('grep -rn "'..matches[2]..'" ./data/cp.lua')
		local read = action:read("*a")
		return read
end


local action = function(msg, matches)

if owners(msg) then

 if matches[1] == "gbancp" then

	if matches[2] then
	get = grep_matches(msg, matches)
	 if get == '' then
  		os.execute('perl -pi -e "s[gbans = \\{][gbans = {\n\t'..matches[2]..',]g" data/cp.lua')
		api.sendReply(msg, "ID " ..matches[2].. " *globalmente baneada* Se Agrego en la lista de _CP_.", true)
		bot_init(true)
	 else
	 	api.sendMessage(msg.chat.id, 'Este usuario *ya había sido baneado* anteriormente.', true)
		return nil
	 end
	end

 	if not matches[2] then
		if msg.reply then
			get = grep_reply(msg)
			action_sucess = api.kickUser(msg.chat.id, msg.reply.from.id)
			if action_sucess then
			 if get == '' then
			 	os.execute('perl -pi -e "s[gbans = \\{][gbans = {\n\t'..msg.reply.from.id..',]g" data/cp.lua')
				api.sendReply(msg, "Usuario *expulsado por CP*.\nID " ..msg.reply.from.id.. " *globalmente baneada*.", true)
				bot_init(true)
			 else
			 	api.sendMessage(msg.chat.id, 'Esta ID *ya había sido globalmente baneada por CP* anteriormente.', true)
			 	return nil
			 end
			end
			if not action_sucess then
			 if get == '' then
			 	os.execute('perl -pi -e "s[gbans = \\{][gbans = {\n\t'..msg.reply.from.id..',]g" data/cp.lua')
				api.sendReply(msg, "Usuario *no expulsado por CP*.\nID " ..msg.reply.from.id.. " *globalmente baneada*.", true)
				bot_init(true)
			 else
			 	api.sendMessage(msg.chat.id, 'Esta ID *ya había sido globalmente baneada por CP* anteriormente.', true)
			 	return nil
			 end
			end
		else
			api.sendMessage(msg.chat.id, "Este comando necesita respuesta")
		end
	end
 end

 if matches[1] == "uncp" then
	if matches[2] then
	get = grep_matches(msg, matches)
	 if get == '' then
	 	api.sendMessage(msg.chat.id, 'Esta ID *ya había sido globalmente desbaneada* anteriormente de la BD.', true)
	  	return nil
	 else
	  	os.execute('sed -i "/' ..matches[2].. '/d" ./data/cp.lua')
		api.sendReply(msg, "ID " ..matches[2].. " *globalmente desbaneada Disculpe los malos entendidos*.", true)
		bot_init(true)
	 end
	end

 	if not matches[2] then
		if msg.reply then
			get = grep_reply(msg)
			action_sucess = api.unbanChatMember(msg.chat.id, msg.reply.from.id)
			if action_sucess then
			 if get == '' then
	 			api.sendReply(msg, 'Esta ID *ya había sido globalmente desbaneada* anteriormente.', true)
	  			return nil
	 		 else
	 		 	os.execute('sed -i "/' ..msg.reply.from.id.. '/d" ./data/cp.lua')
				api.sendReply(msg, "ID " ..msg.reply.from.id.. " *globalmente desbaneada*.\nEste usuario, ya puede ingresar al grupo de nuevo.", true)
				bot_init(true)
			 end
			end
			if not action_sucess then
			 if get == '' then
	 			api.sendReply(msg, 'Esta ID *ya había sido globalmente desbaneada* anteriormente.', true)
	  			return nil
	 		 else
	 		 	os.execute('sed -i "/' ..msg.reply.from.id.. '/d" ./data/cp.lua')
				api.sendReply(msg, "ID " ..msg.reply.from.id.. " *globalmente desbaneada*.\nEste usuario aún no puede ingresar al grupo de nuevo.", true)
				bot_init(true)
			 end
			end
		else
			api.sendMessage(msg.chat.id, "Este comando necesita respuesta")
		end
	end
 end

 if matches[1] == "iscp" then
	if matches[2] then
		local grep = io.popen("grep "..matches[2].. " ./data/cp.lua")
		local list = grep:read("*a")
		if list == "" then
		api.sendMessage(msg.chat.id, "_No se encontraron coincidencias en la Base de datos de CP_", true)
		else
			api.sendMessage(msg.chat.id, "*Demasiado seguro*\nSe encontraron las siguientes coincidencias usuarios reportados por CP:\n\n_"..list.."_", true)
			end
	end

 	if not matches[2] then
		if msg.reply then
			local grep = io.popen("grep "..msg.reply.from.id.. " ./data/cp.lua")
		local list = grep:read("*a")
		if list == "" then
		api.sendReply(msg, "_Esta ID no esta globalmente baneada de CP_", true)
		else
	        api.sendReply(msg, "La ID "..msg.reply.from.id.." está *globalmente baneada*", true)
		end
		end
		end
 end
end

end

return {
	action = action,
	triggers = {
				'^/(gbancp)$',
				'^/(gbancp) (%d+)$',
				'^/(uncp)$',
				'^/(ungcp) (%d+)$',
				'^/(iscp)$',
				'^/(iscp) (%d+)$'
				}
		}
