# frozen_string_literal: true

Rails.application.routes.draw do
  root 'api/v1/home#index'
  mount ShopifyApp::Engine, at: '/'
  resources :home, only: %i[index show edit]
  post 'discounts', to: 'discounts#create'
  namespace :api do
    namespace :v1 do
      get 'home/index'
    end
  end
end
