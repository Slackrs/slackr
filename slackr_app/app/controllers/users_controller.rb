class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		if current_user.id == @user.id
			render :edit
		else
			render :show
		end
	end

end