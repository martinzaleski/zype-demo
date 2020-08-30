Rails.application.routes.draw do

  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:new, :create]

  get '/', to: 'videos#index'
  get '/videos/paginate/:page', controller: 'videos', action: 'paginate'
  resources :videos, only: [:show, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
