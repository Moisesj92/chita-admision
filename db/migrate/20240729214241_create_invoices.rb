class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.string :owner_identification
      t.string :recipient_identification
      t.decimal :amount, precision: 10, scale: 2
      t.string :invoice_identification, index: { unique: true }
      t.date :due_date

      t.timestamps
    end
  end
end
