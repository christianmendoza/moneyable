module ApplicationHelper
  def is_active?(link_path)
    if current_page?(link_path)
      "active"
    else
      ""
    end
  end

  # def transactions_sum
  #   @transactions.sum :amount
  # end

  # def transactions_sum_cleared
  #   @transactions.where(transaction_cleared: true).sum :amount
  # end

  # def account_balance
  #   @account.account_balance + transactions_sum_cleared
  # end

  def get_category_name(id)
    if id.nil?
      cat_name = ''
    else
      category = Category.find(id)
      cat_name = category.category_name
    end    
    cat_name
  end
  
  def get_account_name(id)
    account = Account.find(id)
    account.acount_name
  end
  
  def get_initial_account_balance(id)
    account = Account.find(id)
    account.account_balance
  end

  def get_account_types
    account_types = [
      ["Checking", "1"],
      ["Savings","2"],
      ["Credit Card", "3"]
      # ["Credit Line", "4"],
      # ["Loan", "5"]
    ]
    account_types
  end

  def find_account_type(id)
    case id
    when 1
      "Checking"
    when 2
      "Savings"
    when 3
      "Credit Card"
    # when 4
    #   "Credit Line"
    # when 5
    #   "Loan"
    else
      ""
    end
  end

  def get_transaction_types
    transaction_type = [
      ["Debit", "1"],
      ["Credit", "2"]#,
      #["Transfer-in", "3"],
      #["Transfer-out", "4"]
    ]
    transaction_type
  end
  
  def find_transaction_type(id)
    case id
    when 1
      "Debit"
    when 2
      "Credit"
    # when 3
    #   "Transfer - In"
    # when 4
    #   "Transfer - Out"
    else
      ""
    end
  end

  def get_transaction_status(cleared)
    if(cleared)
      #tag('i', class: 'fi-check')
      "Cleared"
    else
      "Not cleared"
    end
  end

  def format_account_number(number)
    if(!number.empty?)
      "x" << number
    end
  end

  def has_accounts?
    !current_user.accounts.empty?
  end

  def get_all_accounts
    current_user.accounts
  end

  def get_period_select(period)
    # credit: http://stackoverflow.com/questions/13898795/how-to-loop-through-months-in-ruby-on-rails

    start_date = period.months.ago.to_date
    # => Tue, 08 Jan 2013

    end_date = Date.today
    # => Tue, 07 Jan 2014

    number_of_months = (end_date.year * 12 + end_date.month) - (start_date.year * 12 + start_date.month)
    # => 12
    
    dates = number_of_months.times.each_with_object([]) do |count, array|
      date = start_date.beginning_of_month + (count+1).months
      array << [date.strftime("%B %Y"), date.to_s]
    end
    dates.reverse!
    # => [["January 2014", "2014-01-01"],...,["February 2013", "2013-02-01"]]

    select_tag 'period', options_for_select(dates, selected: dates.first.second)
  end
end
