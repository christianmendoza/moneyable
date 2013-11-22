 # Rails Web Application: Moneyable

## Models

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

## Views

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

| ACTION | HTTP METHOD | DEFAULT URL |	DESCRIPTION |
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

##Gems
* [devise](http://rubygems.org/gems/devise) (authentication)
* [paperclip](http://rubygems.org/gems/paperclip) (upload management)
* [carrierwave](http://rubygems.org/gems/carrierwave) (file attachment)
* [money](http://rubygems.org/gems/money) (money library)
* [googlecharts](http://rubygems.org/gems/googlecharts) (sexy charts)