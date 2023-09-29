Rails.application.routes.draw do
  root to: "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create ] do
      resources :comments, only: [:create, :new] # Add :new here
      resources :likes, only: [:create]
    end
  end
end
