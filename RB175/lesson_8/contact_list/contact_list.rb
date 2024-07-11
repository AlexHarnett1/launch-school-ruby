require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, 'secret123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234'
end

before do
  session[:contacts] ||= []
end

get "/" do
  erb :index
end

get "/new" do 
  erb :new_contact
end


# Need to add validations here for the fields...
# Need to create an id for each contact for deletion/reordering
post "/new" do 
  contact_info = {name: params[:name], number: params[:number], email: params[:email]}
  session[:contacts] << contact_info
  session[:message] = "A new contact was added."
  redirect "/"
end



post "/delete" do 
  session[:contacts].delete_at(params[:id].to_i)
  session[:message] = "Contact deleted."
  redirect "/"
end