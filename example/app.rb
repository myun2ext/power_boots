require 'power_boots/sinatra'
require 'power_boots/bs3'

enable :sessions
set :session_secret, 'power boots secret'

database :sqlite3, 'example.sqlite'

class User < PowerBoots::Models::Base
  include PowerBoots::Models::Authentication

  validates :name, :email, presence: true

  def self.create_table
    super do |t|
      t.string :name,  null: false
      t.string :email, null: false
      add_authentication_columns(t)
    end
  end
end
User.create_table

def page(name, &block)
  app_name = "Power Boots"

  bs3 do
    head do
      title app_name + ' ' + name
    end
    body style: "margin-top: 50px" do
      nav do
        brand app_name
        links do
          li "About",  '/about'
          li "Contact",'/contact'
        end
        links class: 'pull-right' do
          li "Sign in",'/sign_in'
        end
      end

      container do
        h1 name
        div &block
      end
    end
  end
end

get '/' do
  user_name = session[:user_name]

  if user_name
    page "Welcome #{user_name}!" do
      tag :p, "Hello #{user_name}! And welcome back."
    end
  else
    page 'Home' do
      tag :p, "Hello Power Boots."
    end
  end
end

get '/about' do
  page 'About' do
    tag :p, "About page."
  end
end

get '/contact' do
  page 'Contact' do
    tag :p, "Contact us."
  end
end

get '/sign_in' do
  page 'Sign In' do
    form '/sign_in' do
      text_field :name
      password :password
      submit
    end
    btn 'Sing up', '/sign_up'
  end
end

post '/sign_in' do
  session[:user_name] = params[:name]
  redirect to '/'
end

get '/sign_up' do
  page 'Sign Up' do
    form '/sign_up' do
      text_field :name
      text_field :email
      password :password
      password :password_confirmation
      submit
    end
  end
end

post '/sign_up' do
  User.create(params)
  redirect to '/'
end
