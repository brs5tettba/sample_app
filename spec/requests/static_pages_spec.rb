require 'spec_helper'

describe "Static pages" do

	let (:static_title) { 'Ruby on Rails Tutorial Sample App | ' }
	
	# Get rid of expect(page)
	subject { page }

	describe "Home page" do
		# executed before each example
		#	before { visit '/static_pages/home' }
		#	This is the named routes way:
		before { visit root_path }

		# Plain-English description displayed in failed test results
		#it "should have the content 'Sample App'" do
		#	expect(page).to have_content('Sample App')
		#end
		# Made possible by subject { page }
		it { should have_content('Sample App') }
		it { should have_title('Ruby on Rails Tutorial Sample App') }
		it { should_not have_title('Home') }
	end

	describe "Help page" do
		before { visit help_path }
		it { should have_content('Help') }
		it { should have_title(static_title + 'Help') }
	end

	describe "About page" do
		before { visit about_path }
		it { should have_content('About') }
		# helper function version:
		it { should have_title (full_title('About Us')) }
	end

	describe "Contact page" do
		before { visit contact_path }
		it { should have_content('Contact')}
		it { should have_title (static_title + 'Contact') }
	end

end
