require 'rubygems'
require 'sinatra'
require 'json'
require 'tokyo_tyrant'
require 'erb'

  
Db = TokyoTyrant::DB.new('127.0.0.1', 1978)
   
 
get '/' do
  @results = JSON.generate(Db.mget(0..(Db.size - 1)))
  p @results
  erb :index
end
 
post '/' do
  
  $WC.set(params[:key], params[:value], :post)
end
 
# put '/' do
#   $WC.set(params[:key], params[:value], :put)
# end
#  
# delete "/" do
#   params[:key].nil? ? $WC.flush : $WC.delete(params[:key])
# end
 
get "/:key" do
  @result = JSON.generate(Db.get(params[:key]))
  erb :show
end
