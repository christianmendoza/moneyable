Moneyable::Application.routes.draw do
  resources :transactions

  resources :categories

  resources :accounts

  devise_for :users
  root "home#index"
end
