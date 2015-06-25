class CohortsController < ApplicationController

	before_action :students_only, only: [:index, :show]
	# before_action :students_only, except: [:edit, :new]

	def new
	end

	def index
	end

	def edit
	end

	def show
		if current_user.producer?
			render :show_producer
		end
	end


end