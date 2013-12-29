module TransactionsHelper
  def format_amount(type, amount)
    case type
    when 1
      "-" << amount
    else
      amount
    end
  end
end
