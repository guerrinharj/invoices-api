class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :name
      t.string :email
      t.float :value
      t.string :code
      t.boolean :paid, default: false
      t.string :description
      t.string :client_address
      t.string :sender_address
      t.date :invoice_date
      t.date :payment_date
      t.text :items, array: true, default: []
      t.integer :terms
      t.timestamps
    end
  end
end
