class Api::V1::InvoicesController < Api::V1::BaseController
  before_action :set_invoice, only: [ :show ]

  def index
    @invoices = Invoice.all
  end

  def show

  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end
end
