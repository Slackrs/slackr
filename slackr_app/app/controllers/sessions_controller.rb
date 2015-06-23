class SessionsController < ApplicationController

	# render login form
  def new
  end

# creates session
  def create
  	user = User.find_by({email: params[:email]})
    # if we found a user with that email
    # and they provided the correct password
    # we get `authenticate` from adding bcrypt
    if user && user.authenticate(params[:password])
      # store their id in session
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      # rerender the form
      redirect_to '/login'
    end
  end

# nulls user session(log out)
  def destroy
  	session[:user_id] = nil
    redirect_to '/login'
  end
end
