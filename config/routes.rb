Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :programs, only: [:index, :show] do
    resources :reviews, only: :create
    resources :watchings, only: :create
    resources :favorites, only: :create
  end
  resources :dashboards do
    resources :accounts, only: [:new, :create, :destroy]
  end
  resources :watchings do
    resources :children_watchings, only: [:new, :create]
  end
end
