Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }
      resources :invoices, only: [:index, :show, :create, :edit, :destroy]
      resources :users, only: [:index, :show, :update]
    end
  end
end
