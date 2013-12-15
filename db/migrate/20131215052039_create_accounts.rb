class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :account_type
      t.string :account_name
      t.string :account_number
      t.decimal :account_balance,       :precision => 10, :scale => 2, :default => 0.0
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
