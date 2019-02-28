require 'dotenv/load'
require 'gmail'


def email
  def initialize(email_address, country)
    @email_address    = email_address
    @country          = country
  end

  def deliver
    Gmail.connect!(ENV['GMAIL_ADDRESS'], ENV['GMAIL_PASSWORD']) do |gmail|
     message = gmail.compose do |m|
       m.to        @email_address
       m.subject   "#{@country.name} #{@country.emoji_flag}"
       m.body      "Here is that report!\n"
       m.add_file  "./country_report.pdf"
     end
     message.deliver!
     gmail.logout
   end
 end
end
