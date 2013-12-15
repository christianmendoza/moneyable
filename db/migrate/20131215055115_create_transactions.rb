class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date_of
      t.integer :transaction_type
      t.string :description
      t.decimal :amount, precision: 10, scale: 2, default: 0.0
      t.boolean :transaction_cleared
      t.string :notes
      t.belongs_to :account, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
