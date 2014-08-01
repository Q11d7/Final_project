require 'bundler' #require bundler
Bundler.require #require everything in bundler in gemfile
require 'pry'
require './lib/project.rb'
get '/' do
  erb :index
end
post "/" do
  number = params[:phone_number]
  Quote.new.Send_Quote(number)
  erb :index
end

