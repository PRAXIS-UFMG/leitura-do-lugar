# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  scope :admin do
    get 'login', to: 'session#login', as: :login
    post 'login', to: 'session#create', as: :create_session
    delete 'session', to: 'session#logout', as: :logout

    root 'admin_dashboard#index', as: :admin_root

    resources :users
    resources :line_analyses
    resources :reports
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
