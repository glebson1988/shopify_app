# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  mount ShopifyApp::Engine, at: '/'
  resources :home
end
