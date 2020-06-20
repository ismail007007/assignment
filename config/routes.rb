Rails.application.routes.draw do

  resources :tests
  root 'posts#new', as: 'home'
  get 'about' => 'pages#about'

  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
