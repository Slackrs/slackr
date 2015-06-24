class ProducersController < ApplicationController
	before_action :authorize, except: [:create, :new]
	before_action :is_producer

	def new
	end

	def index
		@user_type = session[:user_type]
	end

	def edit
	end

	def is_producer
		redirect_to '/login' unless session[:user_type] == 'producer'
	end

end