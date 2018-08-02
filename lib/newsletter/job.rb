require 'newsletter/mailer'

module Newsletter
  Job = Struct.new(:text, :emails) do
    def perform
      emails.each do |address|
        Newsletter::Mailer.deliver_text_to_email(text, address)
      end
    end
  end
end
