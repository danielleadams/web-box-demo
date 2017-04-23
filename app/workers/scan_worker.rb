class ScanWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'devices'

  def perform(message)
    name = message.strip
    label = Label.find_by(name: name)
    label.try(:scan!)
  end
end
