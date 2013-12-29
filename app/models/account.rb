class Account < ActiveRecord::Base
  #attr_accessible :account_type, :account_name, :account_number, :account_balance
  has_many :transactions, dependent: :destroy, order: 'date_of DESC'
  belongs_to :user

  # account_name is required
  # account_number not required, if provided it must be 4 digits
  # account_type must be 1..5
  # account_balance must be greater than 0 and have two decimal places at most

  validates :user_id, :account_name, :account_type, :account_balance, presence: true
  validates :account_number, format: { with: /\A[0-9]{4}\z/ }, allow_blank: true
  validates :account_type, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :account_balance, numericality: { greater_than_or_equal_to: 0 }, format: { with: /\A\d+??(?:\.\d{0,2})?\z/ }
end
