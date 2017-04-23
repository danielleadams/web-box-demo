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
    Label.zpl(name, position)
  end

  class << self
    def zpl(name, position)
      <<-eos
        ^XA
        ^CF0,100^FO50,50^FDHello #{name}!^FS
        ^XZ
      eos
    end
  end
end
