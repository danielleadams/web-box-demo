class LabelsController < ApplicationController
  def new
    @label = Label.new
  end

  def create
    create_label(label_params)
    redirect_to root_url
  end

  def create_from_sms
    create_label(twilio_params) if Label.count < 60
    head :no_content
  end

  def index
    @created_labels = Label.where(status: :created)
    @printed_labels = Label.where(status: :printed)
    @scanned_labels = Label.where(status: :scanned)
  end

  private

  def label_params
    params.require(:label).permit(:name, :position)
  end

  def twilio_params
    data = params['Body'].split("\n")
    {
      name: data[0],
      position: data[1]
    }
  end

  def create_label(params)
    label = Label.create(params)
    label.try(:print!)

    ###
    # Use any way to connect to printer.

    # PrintService.go label.zpl
    # PrinterWorker.new.perform label.zpl
    PrinterWorker.perform_async label.zpl
  end
end
