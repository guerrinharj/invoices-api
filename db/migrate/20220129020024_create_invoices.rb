class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :name
      t.integer :value
      t.string :code
      t.boolean :paid, default: false
      t.string :description
      t.string :address
      t.date :invoice_date
      t.date :payment_date
      t.timestamps
    end
  end
end
