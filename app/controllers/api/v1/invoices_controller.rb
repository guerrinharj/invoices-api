class Api::V1::InvoicesController < Api::V1::BaseController
  before_action :set_invoice, only: [ :show ]

  def index
    @invoices = Invoice.all
  end

  def show
  end

  def update
    if @invoice.update(invoice_params)
      render :show
    else
      render_error
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:name, :email, :value, :code, :invoice_date, :payment_date, :paid, :client_address, :sender_address, :items, :description, :terms)
  end

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end
