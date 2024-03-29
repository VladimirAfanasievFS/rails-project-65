# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :web do
    # get 'auth/request'
    # get 'auth/callback'
    post 'auth/logout'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post 'auth/:provider', to: 'web/auth#request', as: :auth_request
  get 'auth/:provider/callback', to: 'web/auth#callback', as: :callback_auth
  # delete 'auth/logout', to: 'web/auth#logout', as: :logout

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
