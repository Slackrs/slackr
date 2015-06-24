Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  resources :cohorts do
    resources :students
    resources :instructors
    resources :attendances
  end

  resources :users

  root 'sessions#new'

  get     '/login' => 'sessions#new'
  post    '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
 
end
