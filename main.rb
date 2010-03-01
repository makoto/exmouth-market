require 'rubygems'
require 'sinatra'
require 'json'
require 'tokyo_tyrant'
require 'erb'

  
Db = TokyoTyrant::DB.new('127.0.0.1', 1978)
   
 
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
 
# get "/:key" do
#   @result = JSON.generate(Db.get(params[:key]))
#   erb :show
# end

def get_all
  JSON.generate(Db.mget(0..(Db.size - 1)))
end
