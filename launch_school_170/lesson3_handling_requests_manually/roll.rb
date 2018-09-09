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
  client.puts

  client.puts '<h1>Rolls!</h1>'
  rolls = params['rolls'].to_i
  sides = params['sides'].to_i
  rolls_values = (1..rolls).map { rand(1..sides) }
  client.puts "<p>Dice: #{rolls_values}</p>"
  client.puts "<p>Total: #{rolls_values.sum}</p>"

  client.puts '</body>'
  client.puts '</html>'
  client.close
end
