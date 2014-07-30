require 'nokogiri'
require 'open-uri'
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

html = open("http://www.humansofnewyork.com/")

nokogiri_doc = Nokogiri::HTML(html)

quote = nokogiri_doc.css(".p1").children.first

puts "Quote obtained"

# put your own credentials here
account_sid = "ACe330ba04d082392df4cb3511dcb72cec"
auth_token = "2008ea097713e401a16c54029058da82"

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
  :from => '+18152642023',
  :to => "+12038324748",
  :body => quote
  )

puts "Message sent"




