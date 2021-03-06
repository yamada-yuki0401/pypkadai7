Rails.application.routes.draw do
  get 'search' => 'search#search'
  get 'relationships/follow'
  get 'relationships/unfollow'
  devise_for :users
  get 'home/about' => 'homes#about'
  root to: 'homes#top'
  resources :books do
   resource :favorite,only: [:create, :destroy]
  end
  resources :users, only: [:show, :index, :edit, :destory, :update, :create]
end
