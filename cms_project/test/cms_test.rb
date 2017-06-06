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

  #------------------ TESTS --------------------#
  def test_index
    create_document 'changes.txt'
    create_document 'markdown3.md'

    get '/'
    assert last_response.ok?
    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert_match 'changes.txt', last_response.body
    assert_match 'markdown3.md', last_response.body

    assert_includes last_response.body, "<a href='/changes.txt/edit'>edit</a>"
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

    get '/changes.txt/edit'
    assert last_response.ok?
    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert_includes last_response.body, 'Edit content of changes.txt'
    assert_includes last_response.body, 'Save Changes'
    assert_includes last_response.body, '<textarea'

    assert_includes last_response.body, "<button type='submit'"
  end

  def test_updating_document
    create_document 'changes.txt', 'changes'

    post '/changes.txt', content: 'this is a test'
    assert_equal 302, last_response.status
    assert_equal 'this is a test', File.read(File.join(data_path, 'changes.txt'))
    assert_equal 'http://example.org/', last_response.location

    follow_redirect!
    assert last_response.ok?
    assert_includes last_response.body, 'changes.txt has been updated.'
    assert_includes last_response.body, "<a href='/changes.txt'>changes.txt</a>"

    get '/'
    refute_includes last_response.body, 'changes.txt has been updated.'

    get '/changes.txt'
    assert last_response.ok?
    assert_equal 'this is a test', last_response.body
  end

  def test_view_new_document_form
    get '/new'
    assert last_response.ok?
    assert_includes last_response.body, "<label for='filename'>Add a new document:</label>"
    assert_includes last_response.body, "<input"
    assert_includes last_response.body, "<button type='submit'>Create</button>"
  end

  def test_create_new_document
    post '/create', filename: 'story.md'
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
    post '/create'
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'A name is required.'
  end

  def test_create_new_document_with_empty_filename
    post '/create', filename: ''
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'A name is required.'
  end

  def test_delete_document
    create_document 'test.txt'

    post '/test.txt/delete'
    assert_equal 302, last_response.status

    follow_redirect!
    assert last_response.ok?
    refute_includes last_response.body, "<a href='/test.txt'"
    assert_includes last_response.body, "test.txt was deleted"

    get '/'
    refute_includes last_response.body, 'test.txt'
  end
end



  # def erb(filename, var)
  #   path = File.join(ROOT, 'views', "#{filename}.erb")
  #   p path

  #   b = binding
  #   p @files

  #   template = File.read(path)
  #   ERB.new(template).result(b)
  # end

  # def test_before
  #   p before
  # end
