Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  resources :users, only: [:index]
  post "/users/:id/follow", to: "users#follow", as: 'follow_user'
  post "/users/:id/unfollow", to: "users#unfollow", as: 'unfollow_user'
  

  devise_for :users
  resources :profiles
  resources :posts do 
    resources :comments
  end
  post "/posts/:id/like", to: "posts#like", as: 'like_post'

  resources :follows
  resources :likes
  root "home#index"
end
