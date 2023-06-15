Rails.application.routes.draw do
  resources :package_products
  
  namespace :api do
    namespace :v1 do
      resources :packages
      resources :products

      resources :users do
                  end
      
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
