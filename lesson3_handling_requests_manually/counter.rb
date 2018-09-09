require 'socket'

def parse_request(request_line)
  http_method, path_params, protocol = request_line.split
  path, params_str = path_params.split('?')
  params = params_str.to_s.split('&').map { |str| str.split('=') }.to_h

  [http_method, path, params]
end

server = TCPServer.new('localhost', 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  puts request_line

  http_method, path, params = parse_request(request_line)

  client.puts 'HTTP/1.1 200 OK'
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts '<html>'
  client.puts '<body>'
  client.puts '<pre>'

  client.puts "HTTP method: #{http_method}"
  client.puts "Path: #{path}"
  client.puts "Parameters: #{params}"
  client.puts '</pre>'

  number = params['number'].to_i

  client.puts '<h1>Counter</h1>'
  client.puts "<p>The current number is #{number}.</p>"
  client.puts "<a href='?number=#{number - 1}'>Subtract One</a>" \
              " / <a href='?number=#{number + 1}'>Add One</a>"

  client.puts '<br><br>', client.class

  client.puts '</body>'
  client.puts '</html>'
  client.close
end
