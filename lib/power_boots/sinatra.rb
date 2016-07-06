require 'power_boots'
require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'

def html(&block)
  PowerBoots::Html::Document.new(&block).to_s
end
