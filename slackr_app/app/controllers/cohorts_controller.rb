class CohortsController < ApplicationController


	before_action :authorize
	#before_action :students_only, only: [:index, :show]
	# before_action :students_only, except: [:edit, :new]


# INSTRUCTOR & PRODUCER %%%%%%%%%%%%%%%%%%%%%%%%
	# Cohorts Index
	def index
		auth_producer
		@cohorts = current_user.cohorts
	end

	# def new
	# end

	# def index
	# end

	# def edit
	# end

	# def troubled
	# 	@cohort = Cohort.find(params[:id])
	# 	@troublestudents = @cohort.students.

	# 	#pass in 
	# end


end