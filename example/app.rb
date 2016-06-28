require 'sinatra'
require 'power_boots'

class Document < PowerBoots::Html::Document
end

get '/' do
  PowerBoots::Html::Document.new.to_s
end
