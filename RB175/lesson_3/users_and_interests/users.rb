require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

before do
  @user_data = YAML.load_file("users.yaml")
end

helpers do 
  def count_interests
    interest_count = 0
    @user_data.each do |key, value|
      interest_count += value[:interests].count
    end
    interest_count
  end
  
end

get "/" do
  @title = "Home"
  erb :home
end

get "/:user" do
  @username = params[:user]
  @title = @username.capitalize
  @user = @user_data[@username.to_sym]
  erb :user_page
end