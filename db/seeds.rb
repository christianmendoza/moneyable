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
  rand(10.00..500.00).round(2)
end



############################## ACCOUNTS ##############################
puts 'Adding seed accounts'

# 1 = Checking
# 2 = Savings
# 3 = Credit Card

Account.create  type: 1,
                name: "Chase Checking",
                balance: 1500.00

Account.create  type: 2,
                name: "Ally Savings",
                balance: 3000.00

Account.create  type: 3,
                name: "Capital One",
                balance: 2750.52                                    

#rand(1.00..1000.00).round(2)

puts 'Done adding accounts'






############################## TRANSACTIONS ##############################
puts 'Adding seed transactions'

# COLUMN  date  type  description amount  cleared
# TYPE  :date :integer  :string :decimal  :boolean

# 1 = Debit
# 2 = Credit
# 3 = Transfer In
# 4 = Transfer Out

Transaction.create  date: "2013-12-08",
                    type: 1,
                    description: "Best Buy",
                    amount: random_amount,
                    cleared: false

Transaction.create  date: "2013-12-07",
                    type: 2,
                    description: "Paycheck",
                    amount: 1034.34,
                    cleared: true

Transaction.create  date: "2013-12-06",
                    type: 1,
                    description: "",
                    amount: random_amount,
                    cleared: true

#rand(10.00..500.00).round(2)

puts 'Done adding transactions'