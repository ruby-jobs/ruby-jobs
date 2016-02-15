Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks",
      sessions: "users/sessions", registrations: "users/registrations" }
  root 'home#index'

  resources :jobs, except: [:edit, :update, :destroy]

  match '/feed' => 'jobs#feed',
        :as => :feed,
        :defaults => { format: 'atom' }, via: :get

  resources :sitemap, only: :index
end
