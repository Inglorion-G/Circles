FriendCircle::Application.routes.draw do

  get "/feed" => "posts#feed", as: :feed
  resources :users
  resources :circles
  resources :posts, only: [:new, :create, :show, :index]
  resource :session, only: [:new, :create, :destroy]
  root to: "sessions#new"
end
