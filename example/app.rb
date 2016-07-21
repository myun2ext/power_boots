require 'power_boots'
require 'sinatra'

enable :sessions
set :session_secret, 'powersecret'

def User
end

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
  if session[:email]
    con.p "Hello #{session[:email]}", class: :lead

    con.form method: :post, path: '/session' do |f|
      f.hidden :_method, 'delete'
      f.submit :sign_out
    end
  else
    con.p "Power Bootstrap and templates.", class: :lead
    con.h3 "Login"

    con.form style: "width: 200px" do |f|
      f.input     :email,    placeholder: "Your Email Address"
      f.password  :password, placeholder: "Your Password"
      f.submit    :login
      f.text      ' or '
      f.btn       '/registration', 'Sign up', :success
    end
  end
end

page '/about', title: 'About' do |con|
  con.p "About.", class: :lead
end

page '/contact', title: 'Contact' do |con|
  con.p "Contact us.", class: :lead
end

page '/registration', title: 'Sign up' do |con|
  con.p "Registration your account.", class: :lead

  con.form style: "width: 200px", method: :post do |f|
    f.input     :email,    placeholder: "Your Email Address"
    f.password  :password, placeholder: "Your Password"
    f.password  :password_confirmation, placeholder: "Confirmation"
    f.submit    :registration
  end
end

post '/registration' do
  session[:email] = params[:email]
  redirect to('/')
end

delete '/session' do
  session[:email] = nil
  redirect to('/')
end
