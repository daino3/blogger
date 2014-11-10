Blogger::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "home#index"

  resources :blog_posts do
    resource :comments
  end

  resources :emails, only: [:new]
  post 'emails/send' => 'emails#send_email', as: 'send_email'

  post 'search' => 'search#find', as: 'search'
  get 'search_tags/:id' => 'tags#show', as: 'tags'

end
