class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :type
      t.string :name
      t.string :number
      t.decimal :balance, :precision => 10, :scale => 2, :default => 0.0
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
