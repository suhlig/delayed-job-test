require 'json'
require 'pathname'

module Newsletter
  class Mailer
    def self.deliver_text_to_email(text, mail)
      open(Pathname(__dir__) / '../../log/mail.queue', 'a') do |f|
        f.puts({
            created_at: Time.now,
            to: mail,
            body: text
          }.to_json
        )
      end
    end
  end
end
