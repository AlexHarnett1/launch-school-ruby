require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"
require "redcarpet"

root = File.expand_path("..", __FILE__)

configure do
  enable :sessions
  set :session_secret, 'secret123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234'
end

before do
  @files = Dir.glob(root + "/data/*").map {|path| File.basename(path)}
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
    render_markdown(content)
  end
end

get "/" do 
  erb :index
end

get "/:file_name" do
  file_name = params[:file_name]

  if @files.include?(file_name)
    file_path = root + "/data/" + file_name
    load_file_content(file_path)
  else
    session[:message] = "#{file_name} does not exist."
    redirect "/"
  end
end

get "/:file_name/edit" do
  @file_name = params[:file_name]
  file_path = root + "/data/" + @file_name
  @content = File.read(file_path)
  erb :edit
end

post "/:file_name" do 
  @file_name = params[:file_name]
  file_path = root + "/data/" + @file_name
  File.write(file_path, params[:edit_content])
  
  session[:message] = "#{@file_name} has been updated."
  redirect "/"

end

# Create a new view template called edit.erb
# Put an input field and submit button in edit.erb
# Create a post route for /:filename/edit and have it overwrite the file contents 
# and redirect back to home page and show success message.


