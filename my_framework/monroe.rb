class Monroe
  def erb(filename, local = {})
    b = binding
    msg = local[:msg]
    content = File.read("views/#{filename}.erb")
    ERB.new(content).result(b)
  end

  def response(status, headers, body = '')
    body = yield if block_given?
    [status, headers, [body]]
  end
end
