Rails.application.routes.draw do
  resources :accounts, only: [:show]

  namespace :api do
    resources :transactions, only: [:create]
  end

  root 'home#index'
end
