require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234'
end

before do
  session[:lists] ||= []
end

helpers do
  def list_completed?(list)
    todos_count(list) > 0 && num_todos_completed(list) == todos_count(list)
  end

  def list_class(list)
    "complete" if list_completed?(list)
  end

  def todos_count(list)
    list[:todos].size
  end

  def num_todos_completed(list)
    list[:todos].select { |todo| todo[:completed] }.count
  end

  def sort_lists(lists, &block)
    complete_lists, incomplete_lists = lists.partition { |list| list_completed?(list)}

    incomplete_lists.each { |list| yield list, lists.index(list) }
    complete_lists.each { |list| yield list, lists.index(list) }
  end

  def sort_todos(todos, &block)
    complete_todos, incomplete_todos = todos.partition { |todo| todo[:completed]}

    incomplete_todos.each { |todo| yield todo, todos.index(todo) }
    complete_todos.each { |todo| yield todo, todos.index(todo) }
  end
end

get "/" do
  redirect "/lists"
end

# View all of the lists
get "/lists" do
  @lists = session[:lists]
  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do 
  erb :new_list, layout: :layout
end

# Return an error message if the name is invalid. Otherwise, it will return nil.
def error_for_list_name(list_name)
  if !(1..100).cover?(list_name.size)
    "The list name must be between 1 and 100 characters."
  elsif session[:lists].any? {|list| list[:name] == list_name}
    "The list name must be unique."
  end
end

# Return an error message if the name is invalid. Otherwise, it will return nil.
def error_for_todo(name)
  if !(1..100).cover?(name.size)
    "The todo name must be between 1 and 100 characters."
  end
end

# Creates a new list
post "/lists" do
  list_name = params[:list_name].strip
  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    session[:lists] << {name: list_name, todos: []}
    session[:success] = "The list has been added"
    redirect "/lists"
  end
end

# Get a single List
get "/lists/:number" do 
  @list_number = params[:number].to_i
  @list = session[:lists][@list_number]
  erb :list, layout: :layout
end

#Edit an existing Todo list
get "/lists/:number/edit" do
  list_number = params[:number].to_i
  @list = session[:lists][list_number]
  erb :edit_list, layout: :layout
end

#Update and existing Todo list
post "/lists/:number" do
  list_name = params[:list_name].strip
  list_number = params[:number].to_i
  @list = session[:lists][list_number]

  error = error_for_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list, layout: :layout
  else
    @list[:name] = list_name
    session[:success] = "The list has been updated."
    redirect "/lists/#{list_number}"
  end
end

# Delete todo list
post "/lists/:number/delete" do 
  session[:lists].delete_at(params[:number].to_i)
  session[:success] = "The list has been deleted."
  redirect "/lists"
end

# Add a new todo to a list
post "/lists/:list_number/todos" do
  @list_number = params[:list_number].to_i
  @list = session[:lists][@list_number]

  text = params[:todo].strip
  error = error_for_todo(text)
  if error
    session[:error] = error
    erb :list, layout: :layout
  else
    @list[:todos] << {name: params[:todo], completed: false}
    session[:success] = "The Todo has been added."
    redirect "/lists/#{@list_number}"
  end
end

# Delete a todo from a list
post "/lists/:list_number/todos/:todo_number/delete" do
  list_number = params[:list_number].to_i
  list = session[:lists][list_number]
  list[:todos].delete_at(params[:todo_number].to_i)
  session[:success] = "The todo has been deleted."
  redirect "/lists/#{list_number}"
end

# Update the status of a todo
post "/lists/:list_number/todos/:todo_number" do
  list_number = params[:list_number].to_i
  list = session[:lists][list_number]

  is_completed = params[:completed] == "true"
  todo_number = params[:todo_number].to_i
  list[:todos][todo_number][:completed] = is_completed

  session[:success] = "The todo has been updated."
  redirect "/lists/#{list_number}"
end

# Complete all todos
post "/lists/:list_number/complete_all" do
  list_number = params[:list_number].to_i
  list = session[:lists][list_number]
  list[:todos].each do |todo|
    todo[:completed] = true
  end

  session[:success] = "All todos marked as completed."
  redirect "/lists/#{list_number}"
end