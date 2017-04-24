class ScanWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'devices'

  def perform(message)
    id = message.strip
    label = Label.find(id)
    label.try(:scan!)
  end
end
