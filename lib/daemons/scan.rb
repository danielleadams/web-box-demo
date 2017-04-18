require 'socket'

module Daemons
  class Scan
    def self.listen
      server = TCPServer.new 8181

      client = server.accept

      puts "new client: #{client}"

      while message = client.gets
        puts message
      end

      client.close
    end
  end
end
