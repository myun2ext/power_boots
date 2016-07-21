require 'power_boots'
require 'sinatra'

def html(&block)
  PowerBoots::Html::Document.new(&block).to_s
end
