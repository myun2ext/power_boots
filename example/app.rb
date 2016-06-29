require 'power_boots'
require 'sinatra'

class Document < PowerBoots::Html::Document
  def render
    head do |head|
      head.title "Power Boots"
    end

    body do |body|
      body.h1 "Power Boots"
    end
    to_s
  end
end

get '/' do
  Document.new.render
end
