class AddBalanceToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :balance_to_date, :decimal, precision: 10, scale: 2, default: 0.0
  end
end
