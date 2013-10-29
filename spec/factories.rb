# this file exists to define factory_girl_rails factories

FactoryGirl.define do
	# this is the :user factory.
	factory :user do
		name     "Ben Arunski"
		email    "ben@gmail.com"
		password "foobar"
		password_confirmation "foobar"
	end
end
