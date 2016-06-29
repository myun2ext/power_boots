require 'sinatra/base'

module PowerBoots
  class Sinatra < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, 4568

    get '/' do
      "Hello world!"
    end
  end

  def self.sinatra(&block)
    PowerBoots::Sinatra.run!
  end
end
