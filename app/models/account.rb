class Account < ActiveRecord::Base
  attr_accessible :account_type, :account_name, :account_number, :account_balance
  has_many :transactions, dependent: :destroy
  belongs_to :user
end
