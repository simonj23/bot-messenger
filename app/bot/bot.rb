require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(
  access_token: ENV["ACCESS_TOKEN"],
  subscribed_fields: %w[feed mention name]
)

def include_any?(array)
  array.any? {|i| self.include? i}
end

Bot.on :message do |message|

    if message.text.include? "Bonjour"
        message.reply(text: "Salut l'humain !")
    elsif message.text.include? "Ça va"
        message.reply(text: "Je suis un robot, je n'ai donc pas d'émotion.")
    elsif message.text.include? "Comment t'appelles tu ?"
        message.reply(text: 'Mon créateur s\'appelle Simon !')
    else
        message.reply(text: 'Ne sais pas quoi répondre')
    end

end
