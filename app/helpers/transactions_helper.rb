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

  def get_balance_to_date(transaction)
    account = Account.find(transaction.account_id)
    initial_balance = account.account_balance
    sum_previous_amounts = account.transactions.where(["date_of < ? or (date_of = ? and ID <= ?)",
        transaction.date_of, transaction.date_of, transaction.id]).sum(:amount)
    balance = initial_balance + sum_previous_amounts
    balance
  end

  def update_transaction_balances(transactions)
    transactions.each do |t|
      t.balance_to_date = get_balance_to_date(t)
      t.save!
    end
  end

  def balance_to_transaction(transaction)
    transactions = get_all_transactions_after(transaction)
    update_transaction_balances(transactions)
  end
end
