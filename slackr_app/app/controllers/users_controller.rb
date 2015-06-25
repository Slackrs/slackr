class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def get
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

	def update
		@user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to "/users/#{@user.id}"
    else
      render :edit
    end
	end

end