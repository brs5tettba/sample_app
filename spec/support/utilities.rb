include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = User.new_remember_token

		# This test cookies object isn’t a perfect simulation 
		# of the real cookies object; in particular, the 
		# cookies.permanent method doesn’t work inside tests.
    cookies[:remember_token] = remember_token

    user.update_attribute(:remember_token, User.encrypt(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"
  end
end
