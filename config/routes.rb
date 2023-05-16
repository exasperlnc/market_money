Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :markets, only: [:index, :show] do
        resources :vendors, only: [:index]
      end
      resources :vendors, only: [:show, :create]
    end
  end
  # get 'api/v0/markets/:id/vendors', to: "vendors#index", as: 'vendors_index'
  # get "/api/v0/markets/:market_id/vendors/:vendor_id", to: 'vendors#show'
end
