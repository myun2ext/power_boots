require 'power_boots'
require 'sinatra'

get '/' do
  PowerBoots::Html::Document.new do |doc|
    doc.head do |head|
      head.title "Power Boots"
    end

    doc.body do |body|
      body.h1 "Power Boots"
    end
  end.to_s
end
