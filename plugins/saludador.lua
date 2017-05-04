local triggers = {
	'^[Hh](ola)$',
	}

local action = function(msg, blocks, ln)
  if blocks[1] == 'ola' then
	nombre = msg.from.first_name
	math.randomseed(os.time());
	end
 	var = math.random(0,4);
	if var == 0 then
   		api.sendMessage(msg.chat.id, 'Hola *' ..nombre.. '*', true)
	elseif var == 1 then
 	   api.sendMessage(msg.chat.id, 'Hola *' ..nombre.. '* ¿Todo bien?', true)
	elseif var == 2 then
 	   api.sendMessage(msg.chat.id, 'Qué onda *' ..nombre.. '*, un gusto verte :)', true)
	elseif var == 3 then
  	   api.sendMessage(msg.chat.id, '*' ..nombre.. '* :) Hola', true)
  elseif var == 4 then
  	   api.sendMessage(msg.chat.id, '*' ..nombre.. '*, un gusto verlo por aquí.', true)
  end

if blocks[1]=='ola' then
	if msg.from.username == 'HuterCR' then
		api.sendMessage(msg.chat.id,'Hola mi señor,Como esta? \n Yo aqui trabajando en el grupo...',true)
	end
end
end
return {
	action = action,
	triggers = triggers
}
