module UsersHelper
	# Returns the Gravatar (http://gravatar.com/) for the given user.
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_main_url = "https://secure.gravatar.com/"
		gravatar_url =  gravatar_main_url + "avatar/#{gravatar_id}"
		link_to(image_tag(gravatar_url, alt: user.name, class: "gravatar"), gravatar_main_url, target: '_blank')
	end
end
