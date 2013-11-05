class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	# Cross the MVC streams a litle bit and include a 
	# helper (usually for views) in this controller.
	include SessionsHelper
end
