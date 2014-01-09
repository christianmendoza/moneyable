module TransactionsHelper
  def get_transaction_date
    date = Date.today
    if params[:action].eql? "edit"
      date = @transaction.date_of
    end
    date
  end

  def get_category_id
    category_id = 22
    # id for 'Uncategorized'
    
    if params[:action].eql? "edit"
      category_id = @transaction.category_id
    end
    category_id
  end

  def get_transaction_amount
    amount = "0.00"
    if params[:action].eql? "edit"
      amount = number_with_precision(@transaction.amount, precision: 2)
      if @transaction.transaction_type.eql? 1
        amount.delete! "-"
      end
    end
    amount
  end

  def get_total(current_transaction)
    if current_transaction.id == @transactions.first.id
      @previous_transaction = Transaction.find(current_transaction.id)
      @previous_balance = @account.account_balance + current_transaction.amount
    else
      @previous_balance = @previous_balance + current_transaction.amount
      @previous_transaction = Transaction.find(current_transaction.id)
    end
    @previous_balance
  end

  def format_amount(type, amount)
    if type.eql? 1
      amount = "-" << amount
    end
    amount
  end
end
