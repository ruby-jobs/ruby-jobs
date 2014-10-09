Rails.application.routes.draw do
  root 'jobs#index'

  resources :jobs
  match '/feed' => 'jobs#feed',
        :as => :feed,
        :defaults => { format: 'atom' }, via: :get
end
