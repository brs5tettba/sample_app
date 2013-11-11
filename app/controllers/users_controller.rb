class UsersController < ApplicationController
	# The Controllers version of validation: before doing an action, check authorization.
	# signed_in_user is defined in the 'private' section below
	before_action :signed_in_user, only: [:edit, :update, :index]
	before_action :correct_user,   only: [:edit, :update]
	before_action :admin_user,     only: :destroy

  def new
		@user = User.new
  end

	def create
		# Not secure, because it passes all user input to a new user object
		# @user = User.new(params[:user])  # Not the final implementation!
		# This one specifies which parameters are required, and which are permitted/optional
		@user = User.new(user_params)
		if @user.save
			# flash is a hash displayed on the application.html.erb
			sign_in @user
			flash[:success] = "Welcome to the Sample App, " + @user.name + "!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def index
		#@users = User.order("LOWER(name)").load
		# Add pagination (in the view, will_paginate requires this)
		@users = User.order("LOWER(name)").paginate(page: params[:page])
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
#		the correct_user before_filter sets up @user; this would be redundant.
#		@user = User.find(params[:id])
	end

	def update
#		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to users_url
	end

	private

		def user_params
			# use strong parameters to prevent mass assignment vulnerability
			# e.g. :admin is NOT included; no one can make themselves an admin.
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

		def signed_in_user
			# set up friendly forwarding
			store_location 
			# "notice:" is shorthand for "flash[:notice]"
			redirect_to signin_url, notice: "Please sign in." unless signed_in?
		end

		def correct_user
			@user = User.find(params[:id])
			# current_user?() is defined in sessions_helper.rb
			redirect_to(root_url) unless current_user?(@user)
		end

		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end

end
