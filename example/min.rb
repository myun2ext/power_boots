require 'power_boots'
require 'sinatra'

get '/' do
  PowerBoots::Html::Document.new do
    head do
      title "Power Boots"
    end
    body do
      h1 "Power Boots"
      p  "Hello world!"
    end
  end.to_s
end
