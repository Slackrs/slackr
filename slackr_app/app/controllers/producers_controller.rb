class ProducersController < ApplicationController
	before_action :authorize, except: [:create, :new]
	before_action :is_producer

	def index
		@cohorts = current_user.cohorts
	end

	def show
		@cohort = Cohort.find(params[:id])
	end

	def troubled
		@cohort = Cohort.find(params[:id])
		@troublestudents = @cohort.students.

		#pass in 
	end



end