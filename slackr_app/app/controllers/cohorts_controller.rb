class CohortsController < ApplicationController
	before_action :authorize


	#Producer root
	#Shows list of all Cohorts
	def index
		auth_producer
		@cohorts = @current_user.cohorts
	end


end