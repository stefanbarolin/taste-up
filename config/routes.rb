Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :restaurants do
    delete "restaurants/:id", to: "restaurants#destroy", as: "delete"
    resources :meals do
    end
  end
  get "/results", to: 'pages#results', as: "results"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
