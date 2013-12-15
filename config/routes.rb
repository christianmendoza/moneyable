Moneyable::Application.routes.draw do
  resources :accounts

  devise_for :users
  root "home#index"
end
