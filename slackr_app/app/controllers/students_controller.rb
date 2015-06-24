class StudentsController < ApplicationController
	before_action :authorize, except: [:create, :new]
	before_action :is_student
	def new
	end

	def index
	end

	def edit
	end

	def is_student
		redirect_to '/login' unless session[:user_type] == 'student'
	end

end