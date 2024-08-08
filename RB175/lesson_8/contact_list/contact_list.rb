require "sinatra"
require "sinatra/content_for"
require "tilt/erubis"
require_relative "database_persistence"

root = File.expand_path("..", __FILE__)

CONTACT_SORT_TYPES = [:chronological, :alphabetical]

configure do
  enable :sessions
  set :session_secret, 'secret123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234'
end

configure(:development) do
  require "sinatra/reloader"
  also_reload "database_persistence.rb"
end

before do
  @storage = DatabasePersistance.new(logger)
  session[:sort_type_index] ||= 0
end


helpers do
# This can be abstracted to sql
  def sort_contacts(contacts, &block)
    sorted_contacts = []
    sort_type = CONTACT_SORT_TYPES[session[:sort_type_index]]
    case sort_type
    when :chronological
      sorted_contacts = contacts.sort {|contact_a, contact_b| contact_a[:date_added] <=> contact_b[:date_added]}
    when :alphabetical
      sorted_contacts = contacts.sort { |contact_a, contact_b| contact_a[:name] <=> contact_b[:name]}
    end
    sorted_contacts.each(&block)
  end

  def next_sort_type
    CONTACT_SORT_TYPES[session[:sort_type_index]]
  end
end

get "/" do
  @contacts = @storage.all_contacts
  erb :index
end

# Sort contacts
post "/sort" do 
  p CONTACT_SORT_TYPES.length
  session[:sort_type_index] = (session[:sort_type_index] + 1) % CONTACT_SORT_TYPES.length
  p session[:sort_type_index]
  redirect "/"
end

get "/new" do 
  erb :new_contact
end

# Need to add validations here for the fields...
# Create login page????
# To add more complexity, assign contacts to categories (friends, family, work, etc).


# Create new contact
post "/new" do
  if (params[:number].size < 10)
    session[:message] = "Phone number must be at least 10 digits."
    status 422
    erb :new_contact
  else
    @storage.add_contact(params[:name], params[:number], params[:email])
    session[:message] = "A new contact was added."
    redirect "/"
  end
end


# Delete a contact
post "/delete" do 
  @storage.delete_contact(params[:id])
  #session[:contacts].reject! { |contact| contact[:id] == params[:id].to_i }
  session[:message] = "Contact deleted."
  redirect "/"
end