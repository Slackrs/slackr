class StudentsController < ApplicationController

	before_action :authorize
	#before_action :students_only, only: [:index, :show]
	# before_action :students_only, except: [:edit, :new]


# INSTRUCTOR & PRODUCER %%%%%%%%%%%%%%%%%%%%%%%%
	#Roster of Students in Cohort
		#NEED TO REFACTOR STUDENTS MODEL/SO MANY QUERIES
	def index
		if @current_user.producer? || @current_user.instructor?
			@cohort = Cohort.find(params[:cohort_id])
			@students = @cohort.students
		else
			redirect_to '/'
		end
	end

	def troubled
		if @current_user.producer? || @current_user.instructor?
			@cohorts = @current_user.cohorts
			@students = []
			@cohorts.map do |cohort|
				cohort.students.each {|s| @students.push(s)}
			end	
		elsif @current_user.instructor?
			@students = @current_user.students
		else
			redirect_to '/'
		end	
	end

	#Attendance History for a Student
	def show
		if @current_user.producer? || @current_user.instructor?
			@student = Student.find(params[:id])
		elsif @current_user.id == params[:id]
			@student = @current_user
		else
			redirect_to '/'
		end
	end

end


# 	private

# 	def set_cohort
# 		@cohort = Cohort.find(params[:cohort_id])
# 	end