require 'nokogiri'
require 'open-uri'

class Quote

  def initialize
    html = open("http://www.humansofnewyork.com/")

    nokogiri_doc = Nokogiri::HTML(html)

    quote = nokogiri_doc.css(".p1").children.first

    puts "Quote obtained"
  end

end

require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class Text

  def initialize(sid, token, send_to, quote)
    # put your own credentials here
    account_sid = sid
    auth_token = token

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      :from => '+14159341234',
      :to => send_to,
      :body => quote
    )

    puts "Message sent"
  end

end

Quote.new
Text.new('ACe330ba04d082392df4cb3511dcb72cec', '2008ea097713e401a16c54029058da82', "+12038324748", quote)



