require 'socket'

IP = ARGV[0] || 'localhost'
PORT = ARGV[1] || '8080'

message = ARGV[2]

socket = TCPSocket.new IP, PORT

socket.write(message)
socket.close
