# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Invoice.destroy_all

10.times do
  user = User.new
  user.username = "#{Faker::Name.unique.name}"
  user.email = "#{Faker::Name.unique.initials.downcase}@email.com"
  user.password = "password123"
  user.encrypted_password = "password123"
  user.bio = Faker::Quotes::Chiquito.expression
  user.save!
end

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
  invoice.items = inv["items"].each do |item|
    hash_item = {
      name: item["name"],
      quantity: item["quantity"],
      price: item["price"],
      total: item["total"]
    }
  end
  invoice.description = inv["description"]
  invoice.terms = inv["paymentTerms"]
  invoice.user = User.order('RANDOM()').first
  invoice.save!
  puts "#{invoice.code} created!"
end
