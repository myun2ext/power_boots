require 'sinatra/base'

def title(s)
  @title = s
end

def h1(s)
  @h1 = s
end

module PowerBoots
  class Sinatra < Sinatra::Base
    set :bind, '0.0.0.0'
    set :port, 4568

    get '/' do
      PowerBoots::Html::Document.new.to_s
    end

    def self.run!(&block)
      block.yield
      super
    end
  end

  def self.sinatra(&block)
    PowerBoots::Sinatra.run!(&block)
  end
end
