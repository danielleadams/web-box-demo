class Label < ApplicationRecord
  attr_accessor :name, :position

  def zpl
    Label.zpl(name, position)
  end

  class << self  
    def zpl(name, position)
      <<-eos
        ^XA^CF0,100^FO50,50^FDHello #{name}!^FS^XZ
      eos
    end
  end
end
