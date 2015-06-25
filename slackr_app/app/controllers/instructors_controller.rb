class InstructorsController < ApplicationController

	def index
		@cohort = current_user.cohort
		@students = current_user.cohort.students
	end

	def edit
		@
	end

end