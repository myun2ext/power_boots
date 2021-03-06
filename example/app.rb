require 'power_boots/sinatra'
require 'power_boots/bs3'
require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors::Middleware.allow_ip! '0.0.0.0/0'
  BetterErrors.application_root = __dir__
end

enable :sessions
set :session_secret, 'power boots secret'

database :sqlite3, 'example.sqlite'

class User < ActiveRecord::Base
  include PowerBoots::ActiveRecordExtentions
  include PowerBoots::Models::Authentication
  extend  PowerBoots::Validators

  attribute :name,  :string, presence: true, uniqueness: true
  attribute :email, :string, presence: true, uniqueness: true
  only_alnum :name, captal: false, underscore: true

  def self.authenticate(params)
    self.find_by(name: params[:name]).try(:authenticate, params)
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
      notice "Hello #{user_name}! And welcome back."
    end
  else
    page 'Home' do
      info "Hello Power Boots."
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

def sign_in(status = nil)
  page 'Sign In' do
    form '/sign_in' do
      if status == false
        error 'Invalid name or password'
      end
      text_field :name
      password :password
      submit 'Login'
      btn 'Sing up', '/sign_up', :success
    end
  end
end
get '/sign_in' do sign_in end
post '/sign_in' do
  if user = User.authenticate(params)
    session[:user_name] = user.name
    redirect to '/'
  else
    sign_in(false)
  end
end

def sign_up(user = nil)
  page 'Sign Up' do
    form '/sign_up', user do
      text_field :name,   placeholder: 'Johnson Williams'
      text_field :email,  placeholder: 'johnson@williams.com'
      password :password, placeholder: 'Minimum 8 charactors and use numerics and alphabets'
      password :password_confirmation, placeholder: 'Require confirmation'
      submit
    end
  end
end
get '/sign_up' do sign_up end
post '/sign_up' do
  user = User.create(params)
  if user.valid?
    session[:user_name] = user.name
    redirect to '/'
  else
    sign_up user
  end
end
