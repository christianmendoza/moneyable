# Rails Web Application: Moneyable
Moneyable is an web application designed to help manage your finances and keep on top of where your money is going.

## Models

####User
**Associations:** `has_many :accounts`, `dependent: :destroy`, `has_many :transactions, through: :accounts`

A user has many accounts. Deleting a user will delete all of his accounts and transactions. A user has many transactions through accounts.
| COLUMN | first_name | last_name |
|--------|:----------:|:---------:|
| TYPE   | :string    | :string   |

####Account
**Associations:** `belongs_to :user`, `has_many :transactions`, `dependent: :destroy`

An account has many transactions. An account can be of type 'checking', 'savings' or 'credit card'. A new account can be set with a starting balance. Deleting an account will delete all its transactions.

| COLUMN | account_type | account_name | account_number | account_balance | user_id     |
|--------|:------------:|:------------:|:--------------:|:---------------:|:-----------:|
| TYPE   | :integer     | :string      | :string        | :decimal        | :integer    |
| NOTES  |              |              |                |                 | foreign_key |

####Transaction
**Associations:** `belongs_to :account`, `belongs_to: category`

Transactions belong to an account and to a specific category.

| COLUMN | date_of  | transaction_type | description | amount   | transaction_cleared | notes   | account_id  | category_id |
|--------|:--------:|:----------------:|:-----------:|:--------:|:-------------------:|:-------:|:-----------:|:-----------:|
| TYPE   | :date    | :integer         | :string     | :decimal | :boolean            | :string | :integer    | :integer    |
| NOTES  |          |                  |             |          |                     |         | foreign_key | foreign_key |

####Category
**Associations:** `has_many :transactions`, `has_many :subcategories`, 
`belongs_to :parent_category`

A category can have one of more subcategories. A subcategory belongs to its parent category. A category can have many transactions. Deleting a category will update the transactions accordingly.

| COLUMN | category_name | parent_id   |
|--------|:-------------:|:-----------:|
| TYPE   | :string       | integer     |
| NOTES  |               | foreign_key |

####Transfer
A transfers is two transactions - XFER OUT is a transaction withdrawal from one account, XFER IN is a transaction deposit to another account.

| COLUMN | from_account_id | to_account_id | amount   | notes   | date      |
|--------|:---------------:|:-------------:|:--------:|:-------:|:---------:|
| TYPE   | :integer        | :integer      | :decimal | :string | :date     |

## Controllers
* accounts
* categories
* transactions
* transfers

## Views
* accounts: index, new, edit
* categories: index, new, edit
* transactions: index, new, edit
* transfers: _form, index, new, edit, show
* layouts: _navigation, accounts, categories, transactions, transfers

##Pages
* Homepage
* Log in page
* About page
* Contact page

##Partials

* Header
* Footer
* Transaction form
* Transactions view

##RESTful

| ACTION | HTTP METHOD | DEFAULT URL |  DESCRIPTION |
|--------|-------------|-------------|-------------|
| Index | GET | [controller] | Gets a collection of resources |
| Show | GET | [controller]/[id] | Gets a single resource identified by id |
| Edit | GET | [controller]/[id] | Gets a form to edit resources identified by id |
| Delete | GET | [controller]/[id] | Gets a form to confirm a delete of the resource identified by id |
| New | GET | [controller]/new | Gets form to a create a new resource |
| Create | POST | [controller] | Creates the new resource |
| Update | PUT | [controller]/[id] | Updates the resource identified by id |
| Destroy | DELETE | [controller]/[id] | Deletes the resource identified by id |

| ROUTES | ACTIONS |
|--------|:--------:|
| GET /transaction | index |
| GET /transaction/:id | show |
| GET /transaction/new | new |
| GET /transaction/:id/edit | edit |
| POST /transaction | create |
| PUT /transaction/:id | update |
| DELETE /transaction/:id | destroy |

| VERB | ACTIONS |
|--------|:--------:|
| CREATE | new, create |
| READ | index, show |
| UPDATE | edit, update |
| DELETE | destroy |

#####Custom RESTful Actions
| HTTP VERB | ROUTE | ACTION  | EXAMPLE |
|-----------|:-----:|:-------:|:-------:|
| POST      | /transaction/move/:transaction_id/:from_account_id/:to_account_id | move | /transaction/move/25/1/3 |

##Gems
* [devise](http://rubygems.org/gems/devise) (authentication)
* [money](http://rubygems.org/gems/money) (money library)
* [kaminari](https://github.com/amatsuda/kaminariß) (pagination)
* [paperclip](http://rubygems.org/gems/paperclip) (upload management*)
* [carrierwave](http://rubygems.org/gems/carrierwave) (file attachment*)
* [googlecharts](http://rubygems.org/gems/googlecharts) (sexy charts*)
* [best in place](https://github.com/bernat/best_in_place) (in-place editing*)
* [faker](http://rubygems.org/gems/faker) (create fake data, testing*)
* \* denotes a nice-to-have feature

##User Interface
* [twitter bootstrap](http://getbootstrap.com/) (front-end framework)
* [font awesome](http://fontawesome.io/) (icons)
* [toni spinozzi](http://tonispinozzi.com/) (logo)