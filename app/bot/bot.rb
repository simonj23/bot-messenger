require 'facebook/messenger'

include Facebook::Messenger


Bot.on :message do |message|
    if message.text.include? "simon"
        message.reply(text: 'Bonjour maître')
    else
        message.reply(text: 'Reponse par defaut')
    end

end
