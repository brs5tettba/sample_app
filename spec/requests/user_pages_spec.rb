require 'spec_helper'

describe "UserPages" do
	subject { page }

	describe "signup page" do
		# visit, fill_in, click_button, etc. are Capybara verbs
		before { visit signup_path }
		it { should have_content('Sign up') }
		it { should have_title(full_title('Sign up')) }
	end

	describe "profile page" do
		# See spec/factories.rb for my definition of the :user factory
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user) }
		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end

	describe "signup" do
		before { visit signup_path }
		let(:submit) { "Create my account" }
		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
			describe "after submission" do
				before { click_button submit }
				it { should have_title('Sign up') }
				it { should have_content('error') }
			end

			describe "one field is entered incorrectly" do
				before do
					fill_in "Name",         with: "Example User"
					fill_in "Email",        with: "user@example.com"
					fill_in "Password",     with: "foobar"
					fill_in "Confirmation", with: "foobar"
				end
				describe "No name provided" do
					before do
						fill_in "Name",         with: ""
						click_button submit
					end
					it { should have_content("Name can't be blank") }
				end
				describe "No mail provided" do
					before do
						fill_in "Email",        with: ""
						click_button submit
					end
					it { should have_content("Email can't be blank") }
				end
				describe "Invalid email provided" do
					before do
						fill_in "Email",        with: "user@examplecom"
						click_button submit
					end
					it { should have_content("Email is invalid") }
				end
				describe "Password is too short" do
					before do
						fill_in "Password",     with: "foob"
						fill_in "Confirmation", with: "foob"
						click_button submit
					end
					it { should have_content("Password is too short (minimum is 6 characters)") }
				end
				describe "Password is blank" do
					before do
						fill_in "Password",     with: ""
						fill_in "Confirmation", with: ""
						click_button submit
					end
					it { should have_content("Password can't be blank") }
				end
				describe "password confirmation does not match" do
					before do
						fill_in "Password",     with: "foobar"
						fill_in "Confirmation", with: "foobaz"
						click_button submit
					end
					it { should have_content("Password confirmation doesn't match Password") }
				end
			end # one field entered incorrectly
		end # invalid information

		describe "with valid information" do
			before do
				fill_in "Name",         with: "Example User"
				fill_in "Email",        with: "user@example.com"
				fill_in "Password",     with: "foobar"
				fill_in "Confirmation", with: "foobar"
			end
			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end
			describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

				it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
		end # valid information

	end # signup

	describe "edit" do
		let(:user) { FactoryGirl.create(user) }
		before { visit edit_user_path(user) }
		describe "page" do
			it { should have_content("Update your profile") }	
#			it { should have_title("Edit user") }	
			it { should have_link("change", href: 'http://gravatar.com/emails') }	
		end
#		describe "with invalid information" do
#			before { click_button "Save changes" }
#			it { should have_content("error") }
#		end
	end

end
