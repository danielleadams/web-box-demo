require 'socket'

IP = 'localhost'
PORT = ARGV[0] || '8080'

message = ARGV[1]

socket = TCPSocket.new IP, PORT

socket.write(message)
socket.close
