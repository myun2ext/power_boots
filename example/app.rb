require 'power_boots'
require 'sinatra'

get '/' do
  PowerBoots::Html::Document.new do |_|
    _.head do
      _.title "Power Boots"
    end

    _.body do
      _.h1 "Power Boots"
    end
  end.to_s
end
