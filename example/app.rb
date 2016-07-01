require 'power_boots'
require 'sinatra'

#alias sinatra_get get
def route(method, path, title: nil, &block)
  send method, path do
    PowerBoots::Document.new(:bs3) do |app|
      app.app_name "Power Boots"
      app.navigations(
        'Home' => '/',
        'About' => '/about',
        'Contact' => '/contact'
      )
      app.active_page title
      app.title title
      app.main(&block)
    end.render_html
  end
end

route :get, '/' do |con|
  con.p "Power Bootstrap and templates.", class: :lead
end

route :get, '/about', title: 'About' do |con|
  con.p "About.", class: :lead
end
