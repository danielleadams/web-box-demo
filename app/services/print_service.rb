require 'socket'

IP = 'localhost'.freeze
PORT = 8080

class PrintService
  def self.go(message)
    s = TCPSocket.new IP, PORT

    s.write message
    s.close
  end
end
