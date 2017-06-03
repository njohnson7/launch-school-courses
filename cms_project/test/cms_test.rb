ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require_relative '../cms'

class CMSTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert_predicate last_response, :ok?
    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert_match 'about.txt', last_response.body
    assert_match 'changes.txt', last_response.body
    assert_match 'history.txt', last_response.body
    assert_match 'markdown3.md', last_response.body
    assert_equal '/home/one/launchschool/170/cms_project', ROOT
  end

  def test_index_filename
    get '/about.txt'

    assert_predicate last_response, :ok?
    assert_equal 'text/plain', last_response.content_type
    assert_match '1993 - Yukihiro Matsumoto dreams up Ruby.', last_response.body
    assert_equal File.read(File.join(ROOT, 'data', 'about.txt')), last_response.body
  end

  def test_document_not_found
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
    assert_predicate last_response, :ok?
    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert_match cookie[0, 15], last_response['Set-Cookie']
    assert_nil last_response.location
    assert_match 'no_file.ext does not exist.', last_response.body
    assert_match "<a href='/history.txt'>history.txt</a>", last_response.body

    get '/'
    refute_match ' does not exist.', last_response.body
  end

  def test_viewing_markdown_document
    get '/markdown3.md'

    assert_equal 'text/html;charset=utf-8', last_response.content_type
    assert last_response.ok?
    assert_includes last_response.body, '<h5>h5 Heading</h5>'
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
