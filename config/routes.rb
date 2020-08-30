Rails.application.routes.draw do
  
  namespace :api do
    resources :books, only: :show
    resources :authors, only: :show

    post 'search' => 'search#search'
  end
  
  root to: 'home#index'
  match '*path' => 'home#index', via: :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
