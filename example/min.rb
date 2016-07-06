require 'power_boots'
require 'sinatra'

get '/' do
  PowerBoots::Html::Document.new do |html|
    html.head do |head|
      head.title "Power Boots"
    end
    html.body do |body|
      body.h1 "Power Boots"
      body.p  "Hello world!"
    end
  end.to_s
end
