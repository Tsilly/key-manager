Rails.application.routes.draw do
  root 'keychains#index'

  resources :keychains
  resources :categories
end
