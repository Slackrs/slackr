Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]

  get '/students/troubled' => 'students#troubled'
  get '/students/:id/history' => 'students#history', as: 'student_history'

  resources :cohorts, only: [:index] do
    resources :students, only: [:index, :show]
    resources :attendances, only: [:show, :edit, :update]
  end
<<<<<<< HEAD
=======
  
  resources :producers
  resources :students
  resources :instructors
  post '/email/:producer_id' => 'email#create'
>>>>>>> bryant

  resources :users, only: [:index, :get, :edit, :update, :show]
  get '/users/:id/edit_pass' => 'users#edit_pass', as: 'user_edit_pass'
  patch '/users/:id/update_pass' => 'users#update_pass', as: 'user_update_pass'
  # post '/users/:id/edit', :to => 'users#edit'

  root 'sessions#landing'

  get     '/login' => 'sessions#new'  
  post    '/login' => 'sessions#create'
  delete '/login' => 'sessions#destroy'
 
end
