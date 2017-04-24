class ScanWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'devices'

  def perform(message)
    id = message.strip
    label = Label.find_by(id: id)
    label.try(:scan!)
  end
end
