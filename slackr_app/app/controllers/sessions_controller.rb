class SessionsController < ApplicationController

	# render login form
  def new
  end

# creates session
  def create
    producer   = Producer.find_by({email: params[:email]})
    instructor = Instructor.find_by({email: params[:email]})
    student    = Student.find_by({email: params[:email]})

    if producer && producer.authenticate(params[:password])
      # store their id in session
      session[:producer_id] = producer.id
      redirect_to producer_path(producer)
    elsif instructor && instructor.authenticate(params[:password])
      # store their id in session
      session[:instructor_id] = instructor.id
      redirect_to instructor_path(instructor)
      # rerender the form
    elsif student && student.authenticate(params[:password])
      # store their id in session
      session[:student_id] = student.id
      redirect_to student_path(student)
      # rerender the form
    else 
      redirect_to '/login'
    end
  end

# nulls user session(log out)
  def destroy
  	session[:user_id] = nil
    redirect_to '/login'
  end
end
