class SessionsController < ApplicationController

	# render login form
  def new
    render :layout => false

  end

# creates session
  def create
    user = User.find_by({email: params[:email]})
    if user && user.authenticate(params[:password])
      # store their id in session
      session[:user_id] = user.id
      if user.producer?
        redirect_to cohorts_path
      elsif user.instructor?
        redirect_to cohort_students_path(user.cohort_id)
      else
        redirect_to cohort_student_path(user.cohort_id, user.id)
      end
    else
      redirect_to '/login'
    end
  end

  def landing
    if session[:user_id]
      user = User.find(session[:user_id])
      if user.producer?
        redirect_to cohorts_path
      elsif user.instructor?
        redirect_to cohort_students_path(user)
      else
        redirect_to cohort_student_path(user.cohort_id, user.id)
      end
    else
      redirect_to login_path
    end
  end


# nulls user session(log out)
  def destroy
  	session[:user_id] = nil
    redirect_to '/login'
  end
end
