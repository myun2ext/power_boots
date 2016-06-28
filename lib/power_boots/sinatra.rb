require 'sinatra/base'

module PowerBoots
  class Sinatra < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, 4568
  end

  def self.sinatra(&block)
    PowerBoots::Sinatra.run!
  end
end
