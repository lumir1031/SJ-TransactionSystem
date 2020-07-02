Rails.application.routes.draw do
  resources :accounts, only: [:show]

  root 'home#index'
end
