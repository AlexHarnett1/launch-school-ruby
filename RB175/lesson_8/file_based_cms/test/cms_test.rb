ENV["RACK_ENV"] = "test"

require "minitest/autorun"
require "rack/test"
require "fileutils"

require_relative "../cms"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def create_document(name, content = "")
    File.open(File.join(data_path, name), "w") do |file|
      file.write(content)
    end
  end

  def session
    last_request.env["rack.session"]
  end

  def admin_session
    { "rack.session" => { username: "admin" } }
  end

  def test_index
    create_document "about.md"
    create_document "changes.txt"

    get "/"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "about.md"
    assert_includes last_response.body, "changes.txt"

  end

  def test_helllo
    create_document("helllo.txt", "This is Helllo")

    get "/helllo.txt"
    assert_equal 200, last_response.status
    assert_equal "text/plain", last_response["Content-Type"]
    assert_includes last_response.body, "This is Helllo"
  end

  def test_document_not_found
    get "/notafile.ext" # Attempt to access a nonexistent file

    assert_equal 302, last_response.status # Assert that the user was redirected
    
    assert_equal "notafile.ext does not exist.", session[:message]
  end

  def test_viewing_markdown_document
    create_document("about.md", "#Ruby is...")

    get "/about.md"

    assert_equal 200, last_response.status
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes last_response.body, "<h1>Ruby is...</h1>"
  end

  def test_editing_document
    create_document("changes.txt")

    get "/changes.txt/edit", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<textarea"
    assert_includes last_response.body, %q(<input type="submit")
  end

  def test_editing_document_signed_out
    create_document "changes.txt"

    get "/changes.txt/edit"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_updating_document
    post "/changes.txt", {edit_content: "new content"}, admin_session

    assert_equal 302, last_response.status
    assert_equal "changes.txt has been updated.", session[:message]

    get "/changes.txt"
    assert_equal 200, last_response.status
    assert_includes last_response.body, "new content"
  end

  def test_updating_document_signed_out
    post "/changes.txt", {edit_content: "new content"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_view_new_document_form
    get "/new", {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, %q(<button type="submit")
  end

  def test_view_new_document_form_signed_out
    get "/new"

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_new_document
    post "/create", {file_name: "test.txt"}, admin_session

    assert_equal 302, last_response.status
    assert_equal "test.txt was created.", session[:message]

    get "/"
    assert_includes last_response.body, "test.txt"
  end

  def test_create_new_document_signed_out
    post "/create", {file_name: "test.txt"}

    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_create_new_document_without_filename
    post "/create", {file_name: ""}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "A name is required"
  end

  def test_delete_a_document
    create_document("delete.txt")

    post "/delete.txt/delete", {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "delete.txt has been deleted.", session[:message]

    get "/"
    refute_includes last_response.body, %q(href="/delete.txt")
  end

  def test_deleting_document_signed_out
    create_document("delete.txt")

    post "/delete.txt/delete"
    assert_equal 302, last_response.status
    assert_equal "You must be signed in to do that.", session[:message]
  end

  def test_successful_sign_in
    post "/users/sign_in", username: "admin", password: "secret"

    assert_equal 302, last_response.status
    assert_equal "Welcome!", session[:message]
    assert_equal "admin", session[:username]

    get last_response["Location"]
    assert_includes last_response.body, "admin is signed in"
  end

  def test_unsuccessful_sign_in
    post "/users/sign_in", username: "wrong", password: "wrong"

    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, "Invalid credentials"
  end

  def test_sign_out
    post "/users/sign_in", username: "admin", password: "secret"
    get last_response["Location"]
    assert_includes last_response.body, "Welcome"

    post "/users/sign_out"
    get last_response["Location"]

    assert_nil session[:username]
    assert_includes last_response.body, "You have been signed out"
    assert_includes last_response.body, "Sign In"
  end


end