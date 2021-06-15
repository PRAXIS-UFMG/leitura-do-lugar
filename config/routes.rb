# frozen_string_literal: true

Rails.application.routes.draw do
  root "public_content#about_project"
  scope :conteudo do
    Content::NAMES.each_key do |content|
      get content, to: "public_content##{content}", as: "#{content}_content"
    end
  end

  scope :admin do
    get "login", to: "session#login", as: :login
    post "login", to: "session#create", as: :create_session
    delete "session", to: "session#logout", as: :logout

    root "admin_dashboard#index", as: :admin_root

    resources :users
    resources :line_analyses
    resources :reports
    resources :periods
    resources :contents

    resources :medias
    post "medias/:id/edit", to: "medias#edit"

    resources :article, except: [:index, :new, :destroy]

    resources :excerpts, except: :new
    get "excerpts/new/:report", to: "excerpts#new"
  end

  mount FileUploader.derivation_endpoint => "/midias/v"
  get "/midias/:id", to: "medias#inline", as: :public_media

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
