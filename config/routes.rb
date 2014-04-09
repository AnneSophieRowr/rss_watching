RssWatching::Application.routes.draw do

  devise_for :users

  root 'feeds#index'

  resources :items, :users

  resources :feeds do
    resources :items
  end
end
