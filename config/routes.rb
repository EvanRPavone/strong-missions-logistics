require 'sidekiq/web'

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :trips do
    resources :comments
  end
  
  resources :itineraries

  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end


  devise_for :users
  get 'active-sessions', to: "trips#active_sessions"
  root to: 'home#index'
  resources :users, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
