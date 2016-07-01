require 'power_boots'
require 'sinatra'

get '/' do
  PowerBoots::Document.new(:bs3) do |doc|
    doc.title "Power Boots"
  end.render_html
end
