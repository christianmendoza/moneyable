class Transaction < ActiveRecord::Base
  #attr_accessible :date_of, :transaction_type, :description, :amount, :transaction_cleared, :account_id, :category_id, :notes, :to_transaction_id, :from_transaction_id
  belongs_to :account
  belongs_to :category
end
