module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token

		# synonym for: cookies[:remember_token] = { value:   remember_token,
		#                              expires: 20.years.from_now.utc }
		cookies.permanent[:remember_token] = remember_token
		
		# update_attribute bypasses validation, necessary because
		# we save the remember_token before we validate the password
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		# create an instance variable and set it to the parameter
		@current_user = user
	end

	def current_user
		# can't just return @current_user, because with every
		# request, instance variables are reinitialized.
		remember_token = User.encrypt(cookies[:remember_token])
		# ||= is "or equals", the lazy loading equals sign 
		# equivalent to @current_user || @current_user = 
		# ... this is useful if @current_user is used more than once per user request.
		@current_user ||= User.find_by(remember_token: remember_token)
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

end
