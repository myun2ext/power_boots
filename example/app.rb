require 'power_boots'
require 'sinatra'

#alias sinatra_get get
def page(path, title: nil, &block)
  get path do
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

page '/' do |con|
  con.p "Power Bootstrap and templates.", class: :lead
  con.h3 "Login"

  con.form style: "width: 200px" do |f|
    f.input     :email,    placeholder: "Your Email Address"
    f.password  :password, placeholder: "Your Password"
    f.submit    :login
  end
end

page '/about', title: 'About' do |con|
  con.p "About.", class: :lead
end
