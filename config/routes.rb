Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants do
    # delete "restaurants/:id", to: "restaurants#destroy",as: "delete"
    resources :meals, only: [:create, :new, :index]
  end

  get "/results", to: 'pages#results', as: "results"

  resources :meals, only: [:show, :edit, :update, :destroy] do
    resources :meal_reviews, only: [:create]
    #resources :orders, only: [:create, :new, :index]
  end
  resources :orders, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
