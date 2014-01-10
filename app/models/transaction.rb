class Transaction < ActiveRecord::Base
  # attr_accessible :date_of, :transaction_type, :description, :amount, :transaction_cleared, :account_id, :category_id, :notes, :to_transaction_id, :from_transaction_id
  belongs_to :account
  belongs_to :category
  before_save :format_debit_amount, if: :debit?

  scope :this_month,
    lambda {
      where("date_of >= ? AND date_of <= ?", 
        Date.today.beginning_of_month, Date.today.end_of_month)
    }

  scope :debited, -> { where(transaction_type: 1) }
  scope :credited, -> { where(transaction_type: 2) }
  scope :cleared, -> { where(transaction_cleared: true) }  

  class << self
    def period(period)
    # Date.parse("2013-12-01")
    where("date_of >= ? and date_of <= ?",
      Date.parse(period).beginning_of_month, Date.parse(period).end_of_month)
    end

    def get_all_transactions_since(transaction)
      where(["date_of > ? or (date_of = ? and ID <= ?)",
        transaction.date_of, transaction.date_of, transaction.id])
    end

    def update_transaction_balances(transactions)
      amount = 0.00
      transactions.each do |t|
        t.balance_to_date = get_balance(t)
        t.save
      end
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
    self.amount = "-" << self.amount.to_s
  end
end
