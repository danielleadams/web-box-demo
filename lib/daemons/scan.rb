require 'socket'
require 'sidekiq'

require_relative '../../app/workers/scan_worker'

module Daemons
  class Scan
    class << self
      def listen(port: '8181')
        server = TCPServer.new port

        while true
          client = server.accept

          while message = client.gets
            ScanWorker.perform_async(message)
          end

          client.close
        end
      end
    end
  end
end
