require "sinatra"
require "sinatra/reloader"
require "sinatra/content_for"
require "tilt/erubis"

root = File.expand_path("..", __FILE__)

CONTACT_SORT_TYPES = [:chronological, :alphabetical]

configure do
  enable :sessions
  set :session_secret, 'secret123412341234123412341234123412341234123412341234123412341234123412341234123412341234123412341234'
end

before do
  session[:contacts] ||= []
  session[:sort_type_index] ||= 0
end

helpers do
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
  erb :index
end

post "/sort" do 
  p CONTACT_SORT_TYPES.length
  session[:sort_type_index] = (session[:sort_type_index] + 1) % CONTACT_SORT_TYPES.length
  p session[:sort_type_index]
  redirect "/"
end

get "/new" do 
  erb :new_contact
end

def generate_id
  max = session[:contacts].map {|contact| contact[:id] }.max || 1
  max + 1
end

# Need to add validations here for the fields...
# Need to create an id for each contact for deletion/reordering
# Create login page????
# To add more complexity, assign contacts to categories (friends, family, work, etc).

post "/new" do
  phone_number = params[:number].to_i
  if (params[:number].size < 10)
    session[:message] = "Phone number must be at least 10 digits."
    status 422
    erb :new_contact
  else
    contact_info = {name: params[:name], number: phone_number, email: params[:email], id: generate_id, date_added: Time.now}
    session[:contacts] << contact_info
    session[:message] = "A new contact was added."
    redirect "/"
  end
end



post "/delete" do 
  session[:contacts].reject! { |contact| contact[:id] == params[:id].to_i }
  session[:message] = "Contact deleted."
  redirect "/"
end