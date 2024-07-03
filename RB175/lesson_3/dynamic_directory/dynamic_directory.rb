require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @title = "Dynamic Directory"
  @contents = Dir.glob("public/*").map {|file| File.basename(file)}.sort
  @ascending = params[:ascend]
  @contents.reverse! if @ascending == 'false'
  erb :home
end

