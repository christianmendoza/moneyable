module TransactionsHelper
  def get_total(current_transaction)
    if current_transaction.id == @transactions.first.id
      @previous_transaction = Transaction.find(current_transaction.id)
      @previous_balance = get_current_account_balance(@account.id)
      #@previous_balance = 0
    else
      case @previous_transaction.transaction_type

      when 1 # Debit
        @previous_balance = @previous_balance - @previous_transaction.amount
        @previous_transaction = Transaction.find(current_transaction.id)
      when 2 # Credit
        @previous_balance = @previous_balance + @previous_transaction.amount
        @previous_transaction = Transaction.find(current_transaction.id)
      # when 3 # Transfer - In
      #   @previous_balance = @previous_balance - @previous_transaction.amount
      #   @previous_transaction = Transaction.find(current_transaction.id)
      # when 4 # Transfer - Out
      #   @previous_balance = @previous_balance + @previous_transaction.amount
      #   @previous_transaction = Transaction.find(current_transaction.id)
      end
    end
    @previous_balance
  end

  def format_amount(type, amount)
    case type
    when 1
      "-" << amount
    else
      amount
    end
  end
end
