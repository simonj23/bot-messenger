require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(
  access_token: ENV["ACCESS_TOKEN"],
  subscribed_fields: %w[feed mention name]
)

Bot.on :message do |message|

    if message.text.include? "Bonjour"
        message.reply(text: "Salut l'humain !")
    elsif message.text.include? "Ça va ?"
        message.reply(text: "Je suis un robot, je n'ai donc pas d'émotion.")
    elsif message.text.include? "Comment t'appelles tu ?"
        message.reply(text: 'Mon créateur s\'appelle Simon !')
    elsif message.text.include? "Mets-moi 1000 v-bucks sur le hugoviel"
        message.reply(text: "TENTATIVE DE RECONNEXION AU SERVEUR EN COURS")
        sleep(1.5)
        message.reply(text: "LES V-BUCKS ONT ÉTÉ AJOUTÉS AVEC SUCCÈS SUR LE COMPTE HUGOVIEL")
    else
        message.reply(text: 'Je suis en train d\'apprendre et ne sais pas quoi répondre')
    end

end
