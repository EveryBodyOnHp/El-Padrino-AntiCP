local triggers = {
 '^/test'
}
local function onmessage(msg)
 return true end local action = function(msg, blocks)
-- api.sendMessage(msg.chat.id, 'Hola todo bien..', true)
{
 action = action,
 triggers = triggers,
 onmessage = false,
}
