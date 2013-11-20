# Rails Web Application: Moneyable

## Models
--------

####Account
| COLUMN | type     | name    | number  | balance  |
|--------|:--------:|:-------:|:-------:|:--------:|
| TYPE   | :integer | :string | :string | :decimal |

####Transaction
| COLUMN | date     | num     | description | notes   | category_id | withdrawal | deposit  |
|--------|:--------:|:-------:|:-----------:|:-------:|:-----------:|:----------:|:--------:|
| TYPE   | :dateime | :string | :string     | :string | :integer    | :decimal   | :decimal |

####Category
| COLUMN | name    |
|--------|:-------:|
| TYPE   | :string |

####Transfer
| COLUMN | from_account_id | to_account_id | amount   | notes   | date      |
|--------|:---------------:|:-------------:|:--------:|:-------:|:---------:|
| TYPE   | :integer        | :integer      | :decimal | :string | :datetime |

## Controllers
--------

## Views
--------