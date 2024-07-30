class CreateQuotations < ActiveRecord::Migration[7.1]
  def change
    create_table :quotations do |t|
      t.date :request_date
      t.float :document_rate
      t.float :commision
      t.float :advance_percentage
      t.decimal :financing_expense, :precision => 28, :scale => 18
      t.decimal :get_amount, :precision => 28, :scale => 18
      t.decimal :excess, :precision => 28, :scale => 18
      t.belongs_to :invoice, index: true, foreign_key: true

      t.timestamps
    end
  end
end
