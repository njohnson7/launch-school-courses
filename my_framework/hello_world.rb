require_relative 'advice'
# require 'erb'

class HelloWorld
  def call(env)
    case env['REQUEST_PATH']
    when '/'
      ['200', { 'Content-Type' => 'text/html' }, [erb(:index)]]
    when '/advice'
      ['200', { 'Content-Type' => 'text/html' }, [erb(:advice)]]
    else
      ['404', { 'Content-Type' => 'text/html' }, [erb(:not_found)]]
    end
  end

  def erb(file)
    template = File.read("views/#{file}.erb")
    ERB.new(template).result
  end
end
