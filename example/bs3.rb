require 'power_boots/sinatra'
require 'power_boots/bs3'

name = "Power Boots"

get '/' do
  bs3 do
    head do
      title name
    end
    body style: "margin-top: 50px" do
      nav do
        brand name
        links do
          li "About",  '/about'
          li "Contact",'/contact'
        end
      end
      container do
        h1 name
        tag :p, "Hello world!"
      end
    end
  end
end
