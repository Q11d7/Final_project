require 'nokogiri'
require 'open-uri'
require 'twilio-ruby'

class Quote
  def initialize
    nokogiri_doc = Nokogiri::HTML(open("http://www.humansofnewyork.com/"))
    @quote_text = nokogiri_doc.css(".caption").at(0).children.at(0).children
    @picture= nokogiri_doc.css(".fancybox").at(0).attributes.values.at(0).value
  end

  def Send_Quote(send_to)
    # put your own credentials here
    account_sid = "ACe330ba04d082392df4cb3511dcb72cec"
    auth_token = "2008ea097713e401a16c54029058da82"
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create(
      :from => '+18152642023',
      :to => send_to,
      :body => "#{@quote_text} Link:#{@picture}".gsub("<br>", "
        ")
      )
    puts "Message sent"
  end
end
