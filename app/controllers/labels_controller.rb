class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    label = Label.create(label_params)
    label.try(:print!)

    ###
    # Use any way to connect to printer.

    # PrintService.go label.zpl
    # PrinterWorker.new.perform label.zpl
    PrinterWorker.perform_async label.zpl
  end

  private

  def label_params
    params.require(:label).permit(:name, :position)
  end
end
