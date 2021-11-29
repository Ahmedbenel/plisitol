Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :programs, only: [:index, :show] do
    resources :reviews, shallow: true
    resources :watchings, only: :create
    resources :favorites, only: [:create, :destroy]
  end

  get "/dashboard", to: "dashboards#show", as: :dashboard

  resources :children, only: [:create, :destroy]

  resources :watchings do
    resources :children_watchings, only: [:new, :create]
  end
  resources :accounts, only: [:new, :create, :destroy]
end
