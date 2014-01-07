# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

############################## CATEGORIES ##############################
# puts 'Adding seed categories'

# categories = "Auto & Transport|Bills & Utilities|Business Services|Education|Entertainment|Fees & Charges|Financial|Food & Dining|Gifts & Donations|Health & Fitness|Home|Income|Investments|Kids|Loans|Personal Care|Pets|Shopping|Taxes|Transfer|Travel|Uncategorized".split('|').sort

# categories.each { |c| Category.create category_name: c } 

# puts 'Done adding categories'


def random_amount
  rand(10.00..300.00).round(2)
end



############################## ACCOUNTS ##############################
# puts 'Adding seed accounts'

# 1 = Checking
# 2 = Savings
# 3 = Credit Card

# Account.create  type: 1,
#                 name: "Chase Checking",
#                 balance: 1500.00

# Account.create  type: 2,
#                 name: "Ally Savings",
#                 balance: 3000.00

# Account.create  type: 3,
#                 name: "Capital One",
#                 balance: 2750.52

#rand(1.00..1000.00).round(2)

# puts 'Done adding accounts'






############################## TRANSACTIONS ##############################
puts 'Adding seed transactions'

# 1 = Debit
# 2 = Credit
# 3 = Transfer In
# 4 = Transfer Out

def random_date(years_back=1)
  year = Time.now.year - rand(years_back) - 1
  month = rand(12) + 1
  day = rand(31) + 1
  Time.local(year, month, day)
end

# @transactions = Transaction.where("amount > 300")
# @transactions = Transaction.where("category_id = 12")
@transactions = Transaction.where("transaction_type = 1")

@transactions.each do |t|
  amount = t.amount

  if amount > 0
    t.amount = "-" << amount.to_s
    t.save
  end
end

puts "Updated " << @transactions.size << "transactions."

# 10.times do
#   transaction = Transaction.new
#   transaction.date_of = random_date
#   transaction.transaction_type = (1..2).to_a.sample
#   transaction.description = Faker::Company.name
#   transaction.amount = random_amount
#   transaction.transaction_cleared = [true, false].sample
#   transaction.category_id = (1..22).to_a.sample
#   #transaction.account_id = [7, 8, 10, 12].sample
#   transaction.account_id = 8

#   #puts transaction.inspect
#   transaction.save
# end

puts 'Done adding transactions'