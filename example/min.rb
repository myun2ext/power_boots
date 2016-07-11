require 'power_boots'
require 'sinatra'

get '/' do
  PowerBoots::Html::Document.new do |html|
    html.head do
      title
    end
    html.body do
      h1 "Power Boots"
      p  "Hello world!"
    end
  end.to_s
end
