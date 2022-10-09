Rails.application.routes.draw do
  root to: "posts#index"
  
  resources :users, only: [:new, :create] do
    resources :posts, only: [:new, :create]
  end
end
