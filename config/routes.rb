Rails.application.routes.draw do
  root 'items#index'

  get "search" => "search#index", :as => :search


  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items, only: [:create, :show, :index, :destroy]
    end
  end

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]
end
