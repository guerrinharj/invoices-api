Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    devise_for :users
    namespace :v1 do
      resources :invoices, only: [:index, :show, :create, :edit, :destroy]
    end
  end
end
