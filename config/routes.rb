Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api, format: :json do
    namespace :v1 do
      resources :items, only: [:create, :show]
    end
  end
end
