require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(
  access_token: ENV["ACCESS_TOKEN"],
  subscribed_fields: %w[feed mention name]
)


Bot.on :message do |message|

  message.typing_on
  sleep(1.5)
  message.typing_off

  # easy
  if message.text.include? "Bonjour"
      message.reply(text: "Salut l'humain !")
  elsif message.text.include? "Ça va ?"
      message.reply(text: "Je suis un robot, je n'ai donc pas d'émotion.")
  elsif message.text.include? "Comment t'appelles tu ?"
      message.reply(text: 'Mon créateur s\'appelle Simon !')
  else
      type(message)
  end

end

Bot.on :postback do |postback|
  case postback.payload
  when '1'
    puts "Tu préfères Messi !"
  when '2'
    puts "Tu préfères Ronaldo !"
  end
end

