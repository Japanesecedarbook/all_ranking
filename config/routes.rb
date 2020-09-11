Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  root "rankings#index"
  resources :users, only: [:edit, :update]
  resources :rankings, shallow: true do
    resources :comments, only: [:create, :destroy]
    resource :likes, only: %i[create destroy]
    get :likes, on: :collection
    collection do
      get 'search'
    end
  end
end
