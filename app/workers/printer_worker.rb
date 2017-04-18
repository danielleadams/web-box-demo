require 'socket'

class PrinterWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'devices'

  def perform(message)
    socket = TCPSocket.new '192.168.2.2', 9100
    socket.write message
    socket.close
  end
end
