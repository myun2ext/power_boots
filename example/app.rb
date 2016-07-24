require 'power_boots/sinatra'
require 'power_boots/bs3'

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
        tag :div, &block
      end
    end
  end
end

get '/' do
  page 'Home' do
    tag :p, "Hello Power Boots."
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
