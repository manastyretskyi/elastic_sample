Rails.application.routes.draw do
  post 'search' => 'search#search'
  
  root to: 'home#index'
  match '*path' => 'home#index', via: :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
