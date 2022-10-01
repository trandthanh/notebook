Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :folders, only: :show do
    resources :notes, only: :new
  end
  resources :notes, except: :new
end
