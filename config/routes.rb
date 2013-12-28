Moneyable::Application.routes.draw do
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  resources :users do
    resources :accounts, shallow: true
  end

  resources :accounts do
    resources :transactions, shallow: true
  end

  resources :categories

  root "pages#homepage"

  # Pages routes...
  PagesController.action_methods.each do |action|
    get "/#{action}", to: "pages##{action}", as: "#{action}_page"
  end
end
