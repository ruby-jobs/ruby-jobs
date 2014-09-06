Rails.application.routes.draw do
  root 'home#index'

  resources :jobs
end
