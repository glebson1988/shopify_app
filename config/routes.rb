# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  mount ShopifyApp::Engine, at: '/'
  resources :home, only: %i[index show edit]
  post 'discounts', to: 'discounts#create'
end
