# frozen_string_literal: true

Rails.application.routes.draw do
  scope :admin do
    get 'login', to: 'session#login', as: :login
    post 'login', to: 'session#create', as: :create_session
    delete 'session', to: 'session#logout', as: :logout

    resources :users
    resources :line_analyses
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
