require 'power_boots/sinatra'
require 'power_boots/bs3'

name = "Power Boots"

get '/' do
  bs3 do
    head do
      title name
    end
    body do
      h1 name
      tag :p, "Hello world!"
    end
  end
end
