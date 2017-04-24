require 'socket'

PORT = ARGV[0] || '8080'

server = TCPServer.new PORT

puts "Starting server on port #{PORT}"

while true
  client = server.accept

  puts "We have a new client: #{client}"

  while message = client.gets
    puts "Message: #{message}"
  end

  client.close
end
