Rails.application.routes.draw do
  root 'home#index'

  resources :jobs
  match '/feed' => 'jobs#feed',
        :as => :feed,
        :defaults => { :format => 'atom' }, via: :get
end
