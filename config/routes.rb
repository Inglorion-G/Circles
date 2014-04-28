FriendCircle::Application.routes.draw do
  root to: "sessions#new"
  resources :users
  resources :circles, only: [:new, :create, :destroy, :show, :index]
  resource :session, only: [:new, :create, :destroy]
end
