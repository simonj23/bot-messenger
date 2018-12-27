require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(
  access_token: ENV["ACCESS_TOKEN"],
  subscribed_fields: %w[feed mention name]
)

Bot.on :message do |message|
    if message.text.include? "simon"
        message.reply(text: 'Bonjour maître')
    else
        message.reply(text: 'Reponse par defaut')
    end

end
