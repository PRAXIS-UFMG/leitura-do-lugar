# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    get 'conteudos/:slug', to: "contents#show", as: :public_contents
    get 'midias/:name', to: "medias#show", as: :public_media
  end

  # Clearance auth routes and roots
  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resources :users, controller: 'clearance/users', only: Clearance.configuration.user_actions do
    resource :password, controller: 'clearance/passwords', only: [:edit, :update]
  end
  resource :session, controller: 'clearance/sessions', only: [:create]

  constraints Clearance::Constraints::SignedIn.new do
    root to: redirect('/admin'), format: :html

    # Admin panel
    namespace :admin do
      resources :reports
      resources :articles, only: :show
      resources :excerpts
      get "/excerpts/new/:report", to: "excerpts#new"
      resources :periods
      resources :contents
      resources :line_analyses
      resources :medias do
        collection { post :validate_inline }
        member { delete :destroy_inline }
      end
      resources :users
      namespace :paper_trail do
        resources :versions
      end

      root to: "reports#index", as: :root
    end

    delete '/sign_out' => 'clearance/sessions#destroy', as: :sign_out

    get '*path', to: redirect('/admin'), format: :html
  end

  constraints Clearance::Constraints::SignedIn.new { |user| user.admin? } do
    namespace :admin do
      resources :users
    end
  end

  constraints Clearance::Constraints::SignedOut.new do
    root to: 'clearance/sessions#new', as: :sign_in
    get '*path', to: redirect('/'), format: :html
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
