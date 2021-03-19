# frozen_string_literal: true

Rails.application.routes.draw do
  get 'session/login'
  post 'session/login'
  get 'session/logout'
  delete 'session/logout'

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
