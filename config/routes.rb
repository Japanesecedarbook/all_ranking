Rails.application.routes.draw do
  devise_for :users
  root "rankings#index"
  resources :users, only: [:edit, :update]
  resources :rankings, only: [:index, :new, :create, :edit, :update, :destroy]
end
