class User < ActiveRecord::Base
	## VALIDATION
	validates :name, presence: true, length: { maximum: 50 }

	# http://davidcel.is/blog/2012/09/06/stop-validating-email-addresses-with-regex/
	# After the tutorial, replace this silly thing with the simpler one below.
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	#VALID_EMAIL_REGEX = /.+@.+\..+/i
	validates :email, 
		presence: true, 
		format: { with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false}

	# presence validation for :password and :password_confirmation 
	# are included with bcrypt's has_secure_password.
	validates :password, length: { minimum: 6 }

	## CALLBACKS
	#before_save { self.email = email.downcase }
	# use exclamation to alter a value
	before_save { email.downcase! }

	## Enable password with bcrypt-ruby
	# Includes password and password_confirmation attributes, authenticate method, validate password presence, and require that password and password_confirmation match. -- all right out of the boy
	has_secure_password
end
