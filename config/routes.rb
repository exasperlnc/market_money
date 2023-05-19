Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      get 'markets/search', to: 'search#index'
      resources :markets, only: [:index, :show] do
        resources :vendors, only: [:index]
        resources :nearest_atm, only: [:index]
      end
      resources :vendors, only: [:show, :create, :destroy, :update]
      resources :market_vendors, only: [:create, :destroy]
    end
  end
end
