ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'fileutils'

require_relative '../cms'

class CMSTest < Minitest::Test
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

  def yml(str = last_response.body)
    puts str.to_yaml
  end

  def session
    last_request.env['rack.session']
  end

  def admin_session
    { 'rack.session' => { username: 'admin' } }
  end

  #------------------ TESTS --------------------#
  def test_index
    create_document 'changes.txt'
    create_document 'markdown3.md'

    get '/'
    assert last_response.ok?
    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert_match 'changes.txt', last_response.body
    assert_match 'markdown3.md', last_response.body

    assert_includes last_response.body, "/changes.txt/edit"
    assert_includes last_response.body, "<a href='/new'>New Document</a>"
    assert_includes last_response.body, "<button type='submit'>delete"
  end

  def test_viewing_text_document
    create_document 'about.txt', 'This is about'

    get '/about.txt'
    assert last_response.ok?
    assert_equal 'text/plain', last_response.content_type
    assert_equal 'This is about', last_response.body
  end

  def test_viewing_markdown_document
    create_document 'markdown3.md', '# This is a markdown'

    get '/markdown3.md'
    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert last_response.ok?
    assert_includes last_response.body, '<h1>This is a markdown</h1>'
  end

  def test_document_not_found
    create_document 'history.txt'

    get '/no_file.ext'
    assert_equal 302, last_response.status
    assert_equal 'http://example.org/', last_response.location
    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert_predicate last_response, :redirect?
    assert_predicate last_response.content_length, :zero?
    assert_predicate last_response, :redirect?
    cookie = last_response['Set-Cookie']
    assert_operator 100, :<, cookie.size

    follow_redirect!
    assert last_response.ok?
    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert_match cookie[0, 15], last_response['Set-Cookie']
    assert_nil last_response.location
    assert_match 'no_file.ext does not exist.', last_response.body
    assert_match "<a href='/history.txt'>history.txt</a>", last_response.body

    get '/'
    refute_match ' does not exist.', last_response.body
  end

  def test_editing_document
    create_document 'changes.txt'

    get '/changes.txt/edit', {}, admin_session
    assert last_response.ok?
    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert_includes last_response.body, 'Edit content of changes.txt'
    assert_includes last_response.body, 'Save Changes'
    assert_includes last_response.body, '<textarea'

    assert_includes last_response.body, "<button type='submit'"
  end

  def test_updating_document
    create_document 'changes.txt'

    assert_empty File.read(File.join(data_path, 'changes.txt'))
    post '/changes.txt', { content: 'this is a test' }, admin_session
    assert_equal 302, last_response.status
    assert_equal 'http://example.org/', last_response.location

    follow_redirect!
    assert_equal 'this is a test', File.read(File.join(data_path, 'changes-2.txt'))
    assert last_response.ok?
    assert_includes last_response.body, 'changes.txt has been updated'
    assert_includes last_response.body, "<a href='/changes.txt'>changes.txt</a>"

    get '/'
    refute_includes last_response.body, 'changes.txt has been updated'

    get '/changes-2.txt'
    assert last_response.ok?
    assert_equal 'this is a test', last_response.body
  end

  def test_view_new_document_form
    get '/new', {}, admin_session
    assert last_response.ok?
    assert_includes last_response.body, "<label for='filename'>Add a new document:</label>"
    assert_includes last_response.body, '<input'
    assert_includes last_response.body, "<button type='submit'>Create</button>"
  end

  def test_create_new_document
    post '/create', { filename: 'story.md' }, admin_session
    assert_equal 302, last_response.status

    follow_redirect!
    assert last_response.ok?
    assert_includes last_response.body, 'story.md has been created'

    get '/'
    assert_includes last_response.body, 'story.md'
    refute_includes last_response.body, 'story.md has been created'

    get '/story.md'
    assert last_response.ok?
  end

  def test_create_new_document_without_filename
    post '/create', {}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'A name is required.'
  end

  def test_create_new_document_with_empty_filename
    post '/create', { filename: '' }, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'A name is required.'
  end

  def test_delete_document
    create_document 'test.txt'

    post '/test.txt/delete', {}, admin_session
    assert_equal 302, last_response.status

    follow_redirect!
    assert last_response.ok?
    refute_includes last_response.body, "<a href='/test.txt'"
    assert_includes last_response.body, "test.txt was deleted"

    get '/'
    refute_includes last_response.body, 'test.txt'
  end

  def test_signin_index
    get '/'
    assert last_response.ok?
    assert_includes last_response.body, "<a href='/users/signin'>Sign In"
  end

  def test_signin_form
    get '/users/signin'
    assert last_response.ok?
    assert_includes last_response.body, "<label for='username'"
    assert_includes last_response.body, "<label for='password'"
    assert_includes last_response.body, "<input name='username'"
    assert_includes last_response.body, "<input type='password'"
    assert_includes last_response.body, "<button type='submit'"
    assert_includes last_response.body, 'Sign In'
  end

  def test_signin_with_invalid_credentials
    post '/users/signin', username: 'bob', password: 'fred'
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Invalid credentials'
    assert_includes last_response.body, 'bob'
  end

  def test_signin
    post '/users/signin', username: 'admin', password: 'secret'
    assert_equal 302, last_response.status

    follow_redirect!
    assert last_response.ok?
    assert_includes last_response.body, 'Welcome admin!'
    assert_includes last_response.body, 'Signed in as admin.'
    assert_includes last_response.body, '<form'
    assert_includes last_response.body, "action='/users/signout'"
    assert_includes last_response.body, "<button type='submit'>Sign Out"
    refute_includes last_response.body, '>Sign In'
  end

  def test_signout
    post '/users/signin', username: 'admin', password: 'secret'
    follow_redirect!
    assert_includes last_response.body, 'Welcome admin!'

    post '/users/signout'
    assert_equal 302, last_response.status

    follow_redirect!
    assert last_response.ok?
    assert_includes last_response.body, 'You have been signed out.'
    assert_includes last_response.body, '>Sign In'
    refute_includes last_response.body, '>Sign Out'

    get '/'
    refute_includes last_response.body, 'You have been signed out.'
  end

  def test_document_not_found_session
    get '/no_file.ext'
    assert_equal 302, last_response.status
    assert_equal 'no_file.ext does not exist.', session[:msg]
  end

  def test_updating_document_session
    create_document 'changes.txt'

    post '/changes.txt', { content: 'this is a test' }, admin_session
    assert_equal 302, last_response.status
    assert_includes session[:msg], 'changes.txt has been updated'

    get '/changes-2.txt'
    assert last_response.ok?
    assert_includes last_response.body, 'this is a test'
  end

  def test_create_new_document_session
    post '/create', { filename: 'story.md' }, admin_session
    assert_equal 302, last_response.status
    assert_equal 'story.md has been created.', session[:msg]

    get '/'
    assert_includes last_response.body, 'story.md'
  end

  def test_delete_document_session
    create_document 'test.txt'

    post '/test.txt/delete', {}, admin_session
    assert_equal 302, last_response.status
    assert_equal 'test.txt was deleted.', session[:msg]

    get '/'
    refute_includes last_response.body, "href='/test.txt'"
  end

  def test_signin_session
    post '/users/signin', { username: 'admin', password: 'secret' }
    assert_equal 302, last_response.status
    assert_equal 'Welcome admin!', session[:msg]
    assert_equal 'admin', session[:username]

    follow_redirect!
    assert_includes last_response.body, 'Signed in as admin.'
  end

  def test_signin_with_invalid_credentials
    post '/users/signin', username: 'bob', password: 'fred'
    assert_equal 422, last_response.status
    assert_nil session[:username]
    assert_includes last_response.body, 'Invalid credentials.'
  end

  def test_signout_session
    post '/users/signout', {}, admin_session
    assert_equal 'You have been signed out.', session[:msg]
    assert_nil session[:username]
  end

  def test_index_as_signed_in_user
    get '/', {}, admin_session
    assert_equal 'admin', session[:username]
    assert_includes last_response.body, 'Signed in as admin.'
    assert_includes last_response.body, '>Sign Out'
  end

  def test_index_as_not_signed_in_user
    get '/'
    assert_nil session[:username]
    assert_includes last_response.body, '>Sign In'
  end

  def test_signout_session2
    get '/', {}, admin_session
    assert_includes last_response.body, 'Signed in as admin'

    post '/users/signout'
    assert_nil session[:username]
    assert_equal 'You have been signed out.', session[:msg]

    follow_redirect!
    assert_includes last_response.body, '>Sign In'
  end

  def test_validate_credentials_signed_out
    create_document 'changes.txt'
    error_msg = 'You must be signed in to do that.'

    get '/new'
    assert_equal 302, last_response.status
    assert_equal error_msg, session.delete(:msg)

    post '/create'
    assert_equal 302, last_response.status
    assert_equal error_msg, session.delete(:msg)

    get '/changes.txt/edit'
    assert_equal 302, last_response.status
    assert_equal error_msg, session.delete(:msg)

    post '/changes.txt'
    assert_equal 302, last_response.status
    assert_equal error_msg, session.delete(:msg)

    post '/changes.txt/delete'
    assert_equal 302, last_response.status
    assert_equal error_msg, session.delete(:msg)
  end

  def test_validate_credentials_signed_in
    create_document 'changes.txt'
    error_msg = 'You must be signed in to do that'

    get '/new', {}, admin_session
    assert last_response.ok?
    refute_equal error_msg, session.delete(:msg)

    post '/create', { filename: 'test.txt' }, admin_session
    assert_equal 302, last_response.status
    refute_equal error_msg, session.delete(:msg)

    get '/changes.txt/edit', {}, admin_session
    assert last_response.ok?
    refute_equal error_msg, session.delete(:msg)

    post '/changes.txt', {}, admin_session
    assert_equal 302, last_response.status
    refute_equal error_msg, session.delete(:msg)

    post '/changes.txt/delete', {}, admin_session
    assert_equal 302, last_response.status
    refute_equal error_msg, session.delete(:msg)
  end

  def test_other_user_sign_in
    post '/users/signin', username: 'fred', password: 'yoyoyo'
    assert_equal 302, last_response.status
    assert_equal 'fred', session[:username]
    assert_equal 'Welcome fred!', session[:msg]
  end

  def test_invalid_file_extension
    post '/create', { filename: 'bob.omg' }, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, "Filename must end with: #{VALID_EXTENSIONS.join(', ')}"
  end

  def test_duplicate_file
    create_document 'about.md'

    post '/about.md/duplicate', {}, admin_session
    assert_equal 302, last_response.status
    assert_includes session[:msg], 'about.md has been duplicated'

    follow_redirect!
    assert_includes last_response.body, 'about-2.md'
  end

  def test_signup_page
    get '/users/signup'
    assert last_response.ok?
    assert_includes last_response.body, "<form action='/users/signup"
    assert_includes last_response.body, "<label for='username'>Username:"
    assert_includes last_response.body, "<button type='submit'>Sign Up"
  end

  def test_signup_error
    post '/users/signup', username: '', password: '123'
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Username cannot be empty.'

    post '/users/signup', username: 'eric', password: ''
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Password cannot be empty.'

    post '/users/signup', username: 'admin', password: '123'
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Username has already been taken.'
  end

  def test_signup
    original_users = File.read(users_file_path)

    post '/users/signup', username: 'eric', password: 'e'
    assert_equal 302, last_response.status
    assert_equal 'Welcome eric! Your account has been created.', session[:msg]

    follow_redirect!
    assert last_response.ok?
    assert_includes last_response.body, 'Signed in as eric.'
  ensure
    File.write(users_file_path, original_users)
  end

  def test_upload
    get '/new', {}, admin_session
    assert last_response.ok?
    assert_includes last_response.body, 'Upload File'

    post '/upload', {}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Filename cannot be empty.'
  end

  def test_pry
      skip

      get '/'

      ;require'pry';binding.pry;

      assert true
  end
end
