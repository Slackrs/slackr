class ProducersController < ApplicationController

	def new
	end

	def index
		@user_type = session[:user_type]
	end

	def edit
	end

end