Rails.application.routes.draw do
  namespace :api do
    namespace :v0 do
      resources :markets, only: [:index, :show]
        namespace :markets do
          resources :vendors, only: [:index]
      end
    end
  end
end
