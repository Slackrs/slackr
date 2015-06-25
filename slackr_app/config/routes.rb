Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  get '/students/troubled' => 'students#troubled'

  resources :cohorts, only: [:index, :show] do
    resources :students, only: [:index, :show]
    # resources :instructors
    resources :attendances, only: [:show, :edit, :update]
  end

  resources :users, only: [:index, :get, :edit, :update]

  root 'sessions#landing'

  get     '/login' => 'sessions#new'
  post    '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
 
end
