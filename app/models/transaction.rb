class Transaction < ActiveRecord::Base
  # attr_accessible :date_of, :transaction_type, :description, :amount, :transaction_cleared, :account_id, :category_id, :notes, :to_transaction_id, :from_transaction_id, :balance_to_date
  belongs_to :account
  belongs_to :category
  before_save :format_debit_amount, if: :debit?

  # date_of, transaction_type, description, amount, account_id, category_id is required
  # transaction_type must be 1 or 2
  # account_type must be 1..5
  # amount must be greater than 0 and have two decimal places at most

  validates :date_of, :transaction_type, :description, :amount, :account_id, :category_id, presence: true
  validates :transaction_type, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2 }
  validates :account_id, :category_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  scope :this_month,
    lambda {
      where("date_of >= ? AND date_of <= ?", 
        Date.today.beginning_of_month, Date.today.end_of_month)
    }

  scope :transactions_sum,
    lambda {
      sum(:amount)
    }

  scope :debited, -> { where(transaction_type: 1) }
  scope :credited, -> { where(transaction_type: 2) }
  scope :cleared, -> { where(transaction_cleared: true) }  

  class << self
    def period(month)
    # Date.parse("2013-12-01")
    where("date_of >= ? and date_of <= ?",
      Date.parse(month).beginning_of_month, Date.parse(month).end_of_month)
    end

    def get_all_transactions_after(transaction)
      where(["date_of > ? or (date_of = ? and ID <= ?)",
        transaction.date_of, transaction.date_of, transaction.id])
    end

    def get_expenses_amount(month)
      period(month).where("transaction_type = 1").sum(:amount).abs
    end

    def get_incomes_amount(month)
      period(month).where("transaction_type = 2").sum(:amount)
    end

    def get_expenses(month)
      period(month).where("transaction_type = 1").reorder(amount: :desc).includes(:category).group("categories.category_name").sum(:amount)
    end
  end

  private

  def debit?
    self.transaction_type.eql? 1
  end

  def credit?
    self.transaction_type.eql? 2
  end

  def format_debit_amount
    self.amount = self.amount.abs * -1
  end
end
