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
		if @user.instructor?
			info = params['instructor']
		elsif @user.student?
			info = params['student']
		elsif @user.producer?
			info = params['producer']
		end
    if @user.update(info.permit(:name, :email, :phone_num))
      redirect_to "/users/#{@user.id}"
    else
      render :edit
    end
	end

	def edit_pass
		@user = User.find(params[:id])
		if current_user.id == @user.id
			render :edit_pass
		else
			render :show
		end
	end

	def update_pass
		current_user
		if current_user.instructor?
			info = params['instructor']
		elsif current_user.student?
			info = params['student']
		elsif current_user.producer?
			info = params['producer']
		end
		user = User.find(current_user.id)
    if user.authenticate(info[:password])
    	password_hash = {'password' => info[:password_new], 'password_confirmation' => info[:password_confirmation]}
    	if user.update(password_hash.permit(:password, :password_confirmation))
    		redirect_to "/users/#{user.id}"
    	else
    		render :edit_pass
    	end
    else
    	render :edit_pass
    end
	end

	private

end