class InstructorsController < ApplicationController

	before_action :authorize, except: [:create, :new]

	def new
	end


	def index
		@cohort = current_user.cohort
		@students = current_user.cohort.students
	end

	def edit
		
	end

	

end