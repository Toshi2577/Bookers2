Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as:'about'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:index, :edit, :show, :create, :update]
  post 'users/:id' => 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
