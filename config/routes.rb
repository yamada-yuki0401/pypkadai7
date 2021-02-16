Rails.application.routes.draw do

  devise_for :users
  get 'home/about' => 'homes#about'
  root to: 'homes#top'
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :index, :edit, :destory, :update, :create]
end
