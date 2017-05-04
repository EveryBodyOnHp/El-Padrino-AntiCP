local action = function(msg, blocks, ln)

	 		if not(msg.chat.type == 'private') and not is_mod(msg) then return end

	if blocks[1] == 'antibots' then
		if blocks[2]:match('^(on)$') and blocks[2]:match('^(off)$') then
			api.sendMessage(msg.chat.id, 'Available status: on/off')
			return
		end
		local status = blocks[2]
		local current = ('antibots')
		if current == status then
			if msg.added.username then
			local username = msg.added.username:lower()
			if username:find('bot', -3) then
			api.kickChatMember(msg.chat.id, msg.from.id)
			return end
		end
			api.sendReply(msg, 'El sistema Antibots *ya está '..status..'*', true)
		else
--		local response = ('latinbots', status)
			api.sendReply(msg, 'El sistema de Antibots esta: *'..status..'*', true)
		end
	end

end


return {
	action = action,
	triggers = {
	'^/(antibots) (%a%a%a?)$',
	}
}
