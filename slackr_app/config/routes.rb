Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  get '/students/troubled' => 'students#troubled'

  resources :cohorts do
    resources :students
    # resources :instructors
    resources :attendances, only: [:show, :edit]
  end

  resources :users

  root 'sessions#landing'

  get     '/login' => 'sessions#new'
  post    '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
 
end
