require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"
require "redcarpet"
require "yaml"
require "bcrypt"

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, 'secret123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234'
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def load_user_credentials
  credentials_path = if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/users.yml", __FILE__)
  else
    File.expand_path("../users.yml", __FILE__)
  end
  YAML.load_file(credentials_path)
end

def user_signed_in?
  session.key?(:username)
end

def signed_out_redirect
  unless user_signed_in? 
    session[:message] = "You must be signed in to do that."
    redirect "/"
  end
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(file_path)
  content = File.read(file_path)
  case File.extname(file_path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    erb render_markdown(content)
  end
end

get "/" do
  pattern = File.join(data_path, "*")
  @files = Dir.glob(pattern).map {|path| File.basename(path)}
  erb :index
end

get "/new" do
  signed_out_redirect

  erb :new_file
end

post "/create" do 
  signed_out_redirect

  if params[:file_name].strip.empty?
    session[:message] = "A name is required."
    status 422
    erb :new_file
  else
    File.write(data_path + "/" + params[:file_name], "")
    session[:message] = "#{params[:file_name]} was created."
    redirect "/"
  end
end

get "/:file_name" do
  file_path = File.join(data_path, params[:file_name])

  if File.exist?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:file_name]} does not exist."
    redirect "/"
  end
end

get "/:file_name/edit" do
  signed_out_redirect

  @file_name = params[:file_name]
  file_path = File.join(data_path, @file_name)
  @content = File.read(file_path)
  erb :edit
end

post "/:file_name/delete" do
  signed_out_redirect

  @file_name = params[:file_name]
  file_path = File.join(data_path, @file_name)

  File.delete(file_path)
  session[:message] = "#{params[:file_name]} has been deleted."
  redirect "/"
end

post "/:file_name" do 
  signed_out_redirect
 
  @file_name = params[:file_name]
  file_path = File.join(data_path, @file_name)
  File.write(file_path, params[:edit_content])

  session[:message] = "#{@file_name} has been updated."
  redirect "/"
end

get "/users/sign_in" do 
  erb :sign_in

end

def is_user?(username, password)
  users = load_user_credentials
  bcrypt_password = BCrypt::Password.new(users[username])
  users.key?(username) &&  bcrypt_password == password
end

post "/users/sign_in" do 

  if (is_user?(params[:username], params[:password]))
    session[:message] = "Welcome!"
    session[:username] = params[:username]
    redirect "/"
  else
    session[:message] = "Invalid credentials"
    status 422
    erb :sign_in
  end
end

post "/users/sign_out" do 
  session.delete(:username)
  session[:message] = "You have been signed out"
  redirect "/"
end