class Label < ApplicationRecord
  include AASM

  validates_presence_of :name, :position

  aasm column: :status

  aasm do
    state :created, initial: true
    state :printed, :scanned

    event :print do
      transitions from: :created, to: :printed
    end

    event :scan do
      transitions from: :printed, to: :scanned
    end
  end

  def zpl
    Label.zpl(id, name, position)
  end

  class << self
    def zpl(id, name, position)
      <<-eos
        ^XA
        ^FO15,15^BQN,2,6^FDID-#{id}^FS
        ^CF0,50
        ^FO160,30^FDHello, my name is:^FS
        ^CF0,120
        ^FO160,90^FD#{name}^FS
        ^CF0,50
        ^FO15,200^FDTitle: #{position}^FS
        ^XZ
      eos
    end
  end
end
