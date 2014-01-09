def get_balance(transaction)
  (@account.account_balance + @transactions.balance_to_transaction(transaction))
end


def balance_to_transaction(transaction)
  @transactions.where(["date_of < ? or (date_of = ? and ID <= ?)", transaction.date_of, transaction.date_of, transaction.id]).sum(:amount)
end

@account = Account.find 7
@transactions = @account.transactions.order(date_of: :asc)

@transactions.each do |t|
  t.balance_to_date = get_balance(t)
  t.save
end