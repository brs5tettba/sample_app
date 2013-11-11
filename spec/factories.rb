# this file exists to define factory_girl_rails factories

FactoryGirl.define do

	# this is the :user factory.
	factory :user do
		#name     "Ben Arunski"
		#email    "ben@gmail.com"

		# FactoryGirl provides sequences to allow for creating many items at a time.
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "persone_#{n}@example.com" }
		password "foobar"
		password_confirmation "foobar"

		factory :admin do
			admin true
		end
	end # user

end
