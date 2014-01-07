class Transaction < ActiveRecord::Base
  #attr_accessible :date_of, :transaction_type, :description, :amount, :transaction_cleared, :account_id, :category_id, :notes, :to_transaction_id, :from_transaction_id
  belongs_to :account
  belongs_to :category
  before_save :format_debit_amount, if: :debit?

  scope :this_month,
    lambda {
      where("date_of >= ? AND date_of <= ?", 
        Date.today.beginning_of_month, Date.today.end_of_month)
    }

  def self.period(year, month)
    # Date.new(2013, 12)
    where("date_of >= ? and date_of <= ?",
      Date.new(year, month).beginning_of_month, Date.new(year, month).end_of_month)
  end

  def self.period2(period)
    # Date.parse("2013-12-01")
    where("date_of >= ? and date_of <= ?",
      Date.parse(period).beginning_of_month, Date.parse(period).end_of_month)
  end

  scope :debited, -> { where(transaction_type: 1) }
  scope :credited, -> { where(transaction_type: 2) }
  scope :cleared, -> { where(transaction_cleared: true) }

  # attr_accessor :running_total

  # class << self
  #   def balance_with_running_total
  #     total = 0.0
  #     Transaction.order(:id).collect do |t|
  #       total += w.distance
  #       t.running_total = total
  #     end
  #   end
  # end

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
