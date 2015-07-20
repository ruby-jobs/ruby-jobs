Rails.application.routes.draw do
  root 'home#index'

  resources :jobs, except: [:edit, :update, :destroy]

  match '/feed' => 'jobs#feed',
        :as => :feed,
        :defaults => { format: 'atom' }, via: :get
end
