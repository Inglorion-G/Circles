FriendCircle::Application.routes.draw do
  root to: "sessions#new"
  resources :users
  resources :circles
  resources :posts, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
end
