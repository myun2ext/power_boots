require 'power_boots'
require 'sinatra'

set :public_folder, File.dirname(__FILE__) + '/public'

def database(adapter, dbname)
  ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || {
    adapter:  adapter,
    database: dbname
  })
end

def html(&block)
  PowerBoots::Html::Document.new(&block).to_s
end
