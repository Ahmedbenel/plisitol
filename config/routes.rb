Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :programs, only: [:index, :show] do
    resources :reviews, only: :create
  end
  get "/dashboard", to: 'dashboard#show', as: :dashboard
end
