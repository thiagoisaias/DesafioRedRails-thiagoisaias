Rails.application.routes.draw do
  devise_for :users
  resources :users , only: [:index, :show]
  resources :posts , only: [:new, :destroy]
  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  post '/posts/new', to: 'posts#create'
end
