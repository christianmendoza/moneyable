Moneyable::Application.routes.draw do
  resources :transactions
  resources :categories
  resources :accounts
  devise_for :users

  root "pages#homepage"

  # Pages routes ...
  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end
end
