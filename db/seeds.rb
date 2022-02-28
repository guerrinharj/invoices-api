# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Invoice.destroy_all

filepath = "db/data.json"
serialized_json = File.read(filepath)
invoices = JSON.parse(serialized_json)

invoices.each do |inv|
  invoice = Invoice.new
  invoice.name = inv["clientName"]
  invoice.email = inv["clientEmail"]
  invoice.value = inv["total"]
  invoice.code = inv["id"]
  invoice.invoice_date = inv["createdAt"]
  invoice.payment_date = inv["paymentDue"]
  invoice.paid = inv["status"] == "paid"
  invoice.client_address = {
    street: inv["clientAddress"]["street"],
    city: inv["clientAddress"]["city"],
    postCode: inv["clientAddress"]["postCode"],
    country: inv["clientAddress"]["country"]
  }
    invoice.sender_address = {
    street: inv["senderAddress"]["street"],
    city: inv["senderAddress"]["city"],
    postCode: inv["senderAddress"]["postCode"],
    country: inv["senderAddress"]["country"]
  }
  invoice.items = inv["items"].map do |item|
    item = {
      name: item["name"],
      quantity: item["quantity"],
      price: item["price"],
      total: item["total"]
    }
  end
  invoice.description = inv["description"]
  invoice.terms = inv["paymentTerms"]
  invoice.save!
  puts "#{invoice.code} created!"
end
