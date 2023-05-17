Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :markets, only: [:index, :show] do
        resources :vendors, only: [:index]
      end
      resources :vendors, only: [:show, :create, :destroy, :update]
      resources :market_vendors, only: [:create, :destroy]
      namespace :markets do
        resources :search, only: [:index]
      end
    end
  end
end
