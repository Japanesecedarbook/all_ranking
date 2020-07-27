Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  root "rankings#index"
  resources :users, only: [:edit, :update]
  resources :rankings, only: [:index, :new, :create, :edit, :update, :destroy], shallow: true do
    resource :likes, only: %i[create destroy]
    get :likes, on: :collection
  end
end
