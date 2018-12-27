require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(
  access_token: ENV["ACCESS_TOKEN"],
  subscribed_fields: %w[feed mention name]
)

Bot.on :message do |message|

    if message.text.downcase.include? "Bonjour"
        message.reply(text: "Salut l'humain !")
    elsif message.text.downcase.include?. "Ça va ?"
        message.reply.downcase.(text: "Je suis un robot, je n'ai donc pas d'émotion.")
    elsif message.text.downcase.include? "Comment t'appelles tu ?"
        message.reply(text: 'Mon créateur s\'appelle Simon !')
    else
        message.reply(text: 'Je suis en train d\'apprendre et ne sais pas quoi répondre')
    end

end
