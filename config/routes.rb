Rails.application.routes.draw do
  resources :items do
    get 'export', to: 'items#export', on: :collection
  end
  resources :stocks, only: [:edit, :update]
  #'update_stock', to: 'stocks#update_stock'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
end
