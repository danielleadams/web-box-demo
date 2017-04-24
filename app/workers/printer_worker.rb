require 'socket'

class PrinterWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'devices'

  IP = '192.168.2.2'
  PORT = 9100

  def perform(message)
    socket = TCPSocket.new IP, PORT
    socket.write message
    socket.close
  end
end
