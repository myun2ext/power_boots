require 'power_boots'
require 'sinatra'

#alias sinatra_get get
def route(method, path, &block)
  send method, path do
    PowerBoots::Document.new(:bs3) do |doc|
      doc.title "Power Boots"
      doc.main(&block)
    end.render_html
  end
end

route :get, '/' do |con|
  con.p "Power Bootstrap and templates.", class: :lead
end

route :get, '/about' do |con|
  con.p "About.", class: :lead
end
