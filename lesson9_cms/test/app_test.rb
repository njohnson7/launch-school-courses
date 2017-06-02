ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'erb'

require_relative '../app'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert_equal 200, last_response.status
    assert last_response.ok?
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_equal 'text/html;charset=utf-8', last_response.content_type

    assert_equal 'Hello, world!', last_response.body
  end
end
