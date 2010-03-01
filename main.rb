require 'rubygems'
require 'sinatra'
require 'json'
require 'tokyo_tyrant'
require 'erb'

CONFIG = YAML.load_file('./config/config.yml')
HOST = CONFIG[:host]
PORT = CONFIG[:port]
Db = TokyoTyrant::DB.new(HOST, PORT)
TABLE = Db.stat.grep(/path/).first.match(/\t(.*)\n/)[1]
TYPE = Db.stat.grep(/type/).first.match(/\t(.*)\n/)[1]
 
get '/' do
  @results = get_all
  p @results
  erb :index
end
 
get '/stat' do
  @results = Db.stat
  erb :stat
end
 
post '/' do
  values = JSON.parse(params[:values])
  Db.mput(values)
  @results = get_all
  redirect '/'
  # erb :index
end
 
post "/destroy" do
  Db.delete(params[:key])
  @results = get_all
  redirect '/'
end

post "/destroy_all" do
  Db.vanish
  @results = get_all
  redirect '/'
end
 
# get "/:key" do
#   @result = JSON.generate(Db.get(params[:key]))
#   erb :show
# end

def get_all
  JSON.generate(Db.mget(0..(Db.size - 1)))
end
