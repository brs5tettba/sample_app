class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

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

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
