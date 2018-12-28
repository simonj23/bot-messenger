require 'facebook/messenger'

include Facebook::Messenger

Facebook::Messenger::Subscriptions.subscribe(
  access_token: ENV["ACCESS_TOKEN"],
  subscribed_fields: %w[feed mention name]
)

Bot.on :message do |message|

    case message.text
    when "Buttons"
        message.reply(
          attachment: {
            type: 'template',
            payload: {
              template_type: 'button',
              text: 'Who is your favorite player ?',
              buttons: [
                { type: 'postback', title: 'Messi', payload: '1' },
                { type: 'postback', title: 'Ronaldo', payload: '2' }
              ]
            }
          }
        )
    when "Quick replies"
        message.reply(
          text: 'Human, who is your favorite bot?',
          quick_replies: [
            {
              content_type: 'text',
              title: 'You are!',
              payload: 'HARMLESS'
            }
          ]
        )
    end


    # easy
    if message.text.include? "Bonjour"
        message.reply(text: "Salut l'humain !")
    elsif message.text.include? "Ça va ?"
        message.reply(text: "Je suis un robot, je n'ai donc pas d'émotion.")
    elsif message.text.include? "Comment t'appelles tu ?"
        message.reply(text: 'Mon créateur s\'appelle Simon !')
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

