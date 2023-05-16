Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :markets, only: [:index, :show]
        # namespace :markets do
          # resources :vendors, only: [:index, :show]
      # end
    end
  end

  get "/api/v0/markets/:market_id/vendors/:vendor_id", to: 'vendors#show'
end
