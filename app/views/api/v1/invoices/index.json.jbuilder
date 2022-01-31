json.array! @invoices do |invoice|
  json.extract! invoice, :id, :name, :email, :value, :code, :invoice_date, :payment_date, :paid, :client_address, :sender_address, :items, :description, :terms
  json.url url_for(api_v1_invoice_url(invoice))
end
