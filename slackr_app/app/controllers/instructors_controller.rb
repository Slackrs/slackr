class InstructorsController < ApplicationController
	before_action :authorize, except: [:create, :new]
	before_action :is_instructor
	def new
	end

	def index
	end

	def edit
	end

	def is_instructor
		redirect_to '/login' unless session[:user_type] == 'instructor'
	end

end