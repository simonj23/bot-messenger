require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(
  access_token: ENV["ACCESS_TOKEN"],
  subscribed_fields: %w[feed mention name]
)

puts "TEst".downcase

Bot.on :message do |message|


    if message.text.downcase.include? "bonjour" | "hello" | "yo" | "coucou"
        message.reply(text: "Salut l'humain !")
    elsif message.text.downcase.include? "ça va"
        message.reply(text: "Je suis un robot, je n'ai donc pas d'émotion.")
    elsif message.text.downcase.include? "comment t'appelles tu ?" | "quel est ton nom"
        message.reply(text: 'Mon créateur s\'appelle Simon !')
    else
        message.reply(text: 'Ne sais pas quoi répondre')
    end

end
