local discordia = require('discordia')
local client = discordia.Client()
local gifs = {
  "https://gifimage.net/wp-content/uploads/2017/11/evangelion-congratulations-gif-8.gif", --Congratulations from Evangelion
}

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

local TriggerWords = {
  "I",
  "do",
  "not",
  "want",
  "to",
  "be",
  "cancelled"
}

client:on('messageCreate', function(message)
  for i,v in pairs(TriggerWords) do
	   if string.find(message.content, v) then
		     --print('TriggerWord found: '..v)
         message.channel:send {
           embed = {
             image = {
               url = "https://gifimage.net/wp-content/uploads/2017/11/evangelion-congratulations-gif-8.gif"
             },
             footer = {
               text = "Bot by Smaltin"
             },
             color = discordia.Color.fromRGB(114, 137, 218).value,
           },
         }
         break
	    end
  end
end)

client:run('Bot <INSERT TOKEN HERE>')
