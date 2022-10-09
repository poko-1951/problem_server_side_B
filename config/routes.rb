Rails.application.routes.draw do
  root to: "posts#index"

  resources :users, only: [:new, :create] do
    resources :posts, only: [:new, :create]
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
