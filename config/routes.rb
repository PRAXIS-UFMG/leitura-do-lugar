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
    resources :media
    post '/media/inline', to: 'media#inline'
  end

  get '/midias/:id', to: 'media#inline', as: :public_media

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
