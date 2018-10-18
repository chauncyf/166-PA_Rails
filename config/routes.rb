Rails.application.routes.draw do
  root 'index#home'

  # get 'index/home'

  get '/courses', to: 'courses#index'
  get '/instructors', to: 'instructors#index'
  get '/subjects', to: 'subjects#index'

  get 'users/index'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  resources :courses
  resources :instructors
  resources :subjects
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'courses#index'
end
