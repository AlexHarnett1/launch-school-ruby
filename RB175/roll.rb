require "socket"

def parse_request(request_line)
  http_method, path_params, http = request_line.split(" ")
  path, params = path_params.split("?")
  params = (params || "").split("&").each_with_object({}) do |pair, hash|
    key, value = pair.split("=")
    hash[key] = value
  end

  [http_method, path, params]
end

server = TCPServer.new("localhost", 3003)

loop do 
  client = server.accept
  client.puts "HTTP/1.1 200 OK\r\n\r\n"

  request_line = client.gets
  puts request_line

  next unless request_line

  http_method, path, params = parse_request(request_line)

  client.puts request_line
  params["rolls"].to_i.times do
    client.puts rand(params["sides"].to_i) + 1
  end

  client.close
end