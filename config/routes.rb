Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'splash#index'
    resources :categories, only: [:index, :new, :show, :create] do
      resources :spendings, only: [:index, :new, :create]
    end
end

