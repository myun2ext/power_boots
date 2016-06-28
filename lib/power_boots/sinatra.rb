require 'sinatra'

module PowerBoots
  def self.sinatra(&block)
    PowerBoots::Sinatra.new
  end
end
