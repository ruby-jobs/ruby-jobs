Rails.application.routes.draw do
  root 'home#index'

  resources :jobs, except: [:edit, :update, :destroy]

  match '/feed' => 'jobs#feed',
        :as => :feed,
        :defaults => { format: 'atom' }, via: :get

  resources :sitemap, only: :index

  namespace :api do
    namespace :v1 do
      resources :jobs, only: [:index, :show]
    end
  end
end
