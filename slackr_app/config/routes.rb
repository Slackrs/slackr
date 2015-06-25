Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  get '/students/troubled' => 'students#troubled'

  resources :cohorts, only: [:index] do
    resources :students, only: [:index, :show]
    # resources :instructors
    resources :attendances, only: [:show, :edit, :update]
  end

  resources :users, only: [:index, :get, :edit, :update]

  # root 'sessions#landing'
  root 'sessions#new'

  get     '/login' => 'sessions#new'
  post    '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
 
end
