Rails.application.routes.draw do
  resources :subjects
  get 'index/home'
  resources :instructors
  resources :courses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'courses#index'
  root 'index#home'
end
