Rails.application.routes.draw do

  resources :registered_applications


  namespace :api, defaults: { format: :json } do
      match '/events', to: 'events#preflight', via: [:options]
      resources :events, only: [:create]
  end


  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#index"

end
