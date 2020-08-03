Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root "rankings#index"
  resources :users, only: [:edit, :update]
  resources :rankings, shallow: true do
    resource :likes, only: %i[create destroy]
    get :likes, on: :collection
    collection do
      get 'search'
    end
  end
end
