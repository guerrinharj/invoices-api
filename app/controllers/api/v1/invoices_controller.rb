class Api::V1::InvoicesController < Api::V1::BaseController
  before_action :set_invoice, only: [ :show, :update ]

  def index
    if params[:paid] == "true"
      @invoices = Invoice.where(paid: true)
    elsif params[:paid] == "false"
      @invoices = Invoice.where(paid: false)
    else
      @invoices = Invoice.all
    end
  end

  def show
  end

  def update
    if @invoice.update(invoice_params)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice.destroy
    head :no_content
  end

  private

  def invoice_params
    params.require(:invoice).permit(:name, :email, :value, :code, :invoice_date, :payment_date, :paid, :client_address, :sender_address, :items, :description, :terms)
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end
