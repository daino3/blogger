Blogger::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"

  resources :blog_posts do
    resource :comments
  end

  post 'send_email' => 'emails#create', as: 'send_email'

  get 'search' => 'searches#find', as: 'search'
  get 'search_tags/:id' => 'tags#show', as: 'tags'
end
