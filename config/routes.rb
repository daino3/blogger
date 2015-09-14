Blogger::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"

  resources :blog_posts, only: [:index, :show]
  resources :tags, only: [:show]

  post 'send_email' => 'emails#create', as: 'send_email'
  get 'search' => 'searches#find', as: 'search'
end
