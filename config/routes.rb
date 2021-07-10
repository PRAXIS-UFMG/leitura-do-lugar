# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    get 'contents/:slug', to: "contents#show"
  end

  namespace :admin do
    resources :reports
    resources :articles, only: :show
    resources :excerpts
    get "/excerpts/new/:report", to: "excerpts#new"
    resources :periods
    resources :contents
    resources :line_analyses
    resources :medias
    resources :users

    # namespace :paper_trail do
    #   resources :versions
    # end

    root to: "reports#index", as: :root
  end

  scope path: :admin do
    resources :passwords, controller: "clearance/passwords", only: [:create, :new]
    resources :users, controller: "clearance/users", only: [:create] do
      resource :password, controller: "clearance/passwords", only: [:edit, :update]
    end

    resource :session, controller: "clearance/sessions", only: [:create]
    get "/sign_in" => "clearance/sessions#new", :as => "sign_in"
    delete "/sign_out" => "clearance/sessions#destroy", :as => "sign_out"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
