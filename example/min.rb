require 'power_boots/sinatra'

get '/' do
  html do
    head do
      title "Power Boots"
    end
    body do
      h1 "Power Boots"
      tag :p, "Hello world!"
    end
  end
end
