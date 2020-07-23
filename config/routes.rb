Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  root "rankings#index"
  resources :users, only: [:edit, :update]
  resources :rankings, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
end
