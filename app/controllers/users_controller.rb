class UsersController < ApplicationController
		before_filter :authenticate_user!

	def index
		@users = User.search(params[:search])
	end

	def show
		@user = User.find(params[:id])
		if @user.admin == false
		@user.update_attribute(:admin, true)
		redirect_to users_path, :notice => "The user has been made admin"
		else
		@user.update_attribute(:admin, false)
		redirect_to users_path, :notice => "The user has been removed as an admin"
		end
	end

	def update
		@user = User.find(params[:id])

	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path, :notice => "The user has been banned"
	end
end
