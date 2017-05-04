local triggers = {
	'^![Cc](lick)$',
	}

local action = function(msg, blocks, ln)
  if blocks[1] == 'lick' then
	nombre = msg.from.first_name
	math.randomseed(os.time());
	end
 	var = math.random(0,4);
	if var == 0 then
   		api.sendMessage(msg.chat.id, '😜👈 Tira otra..', true)
	elseif var == 1 then
 	   api.sendMessage(msg.chat.id, '😜👈 casi', true)
	elseif var == 2 then
 	   api.sendMessage(msg.chat.id, 'Por poco  😜👈', true)
	elseif var == 3 then
  	   api.sendMessage(msg.chat.id, '😜👈', true)
  	elseif var == 4 then
  	   api.sendMessage(msg.chat.id, 'Sr *' ..nombre.. '*, 😵👈 Muerto.', true)  
  end
end

return {
	action = action,
	triggers = triggers
}
