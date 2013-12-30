module ApplicationHelper
  def is_active?(link_path)
    if current_page?(link_path)
      "active"
    else
      ""
    end
  end

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
  
  def get_current_account_balance(id)
    account = Account.find(id)
    account.account_balance
  end

  def get_account_types
    account_types = [
      ["Checking", "1"],
      ["Savings","2"],
      ["Credit Card", "3"],
      ["Credit Line", "4"],
      ["Loan", "5"]
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
    when 4
      "Credit Line"
    when 5
      "Loan"
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
    when 3
      "Transfer - In"
    when 4
      "Transfer - Out"
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

  def get_category_id
    category_id = 22 # id for 'Uncategorized'
    if (params[:action] == "edit")
      category_id = @transaction.category_id
    end
  end

  def get_transaction_amount
    amount = "0.00"
    if (params[:action] == "edit")
      amount = number_with_precision(@transaction.amount, precision: 2)
    end
  end
end
