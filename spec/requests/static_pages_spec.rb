require 'spec_helper'

describe "Static pages" do
	
	it "should have the right links on the layout" do
		# Traverse the entire website via header (and other) links.
		visit root_path
		click_link "About"
		expect(page).to have_title(full_title('About'))
		click_link "Help"
		expect(page).to have_title(full_title('Help'))
		# The logo links to home ... be sure you start somewhere other than home.
		click_link "sample app"
		expect(page).to have_selector('h1', text: 'Sample App')
		click_link "Contact"
		expect(page).to have_title(full_title('Contact'))
		click_link "Home"
		expect(page).to have_selector('h1', text: 'Sample App')
		# Home must precede Sign up.
		click_link "Sign up now!"
		expect(page).to have_title(full_title('Sign up'))
	end

	subject { page }
	let (:static_title) { 'Ruby on Rails Tutorial Sample App | ' }
	
	shared_examples_for "all static pages" do
		it { should have_selector('h1', text: heading) }
		it { should have_title(full_title(page_title)) }
	end

	describe "Home page" do
		#	This is the named routes way:
		before { visit root_path }
		# for shared_examples..
		let(:heading) { 'Sample App' }
		let(:page_title) { '' }
		# Made possible by shared_examples...
		it_should_behave_like "all static pages"
		it { should_not have_title('Home') }
	end

	describe "Help page" do
		before { visit help_path }
		let(:heading) { 'Help' }
		let(:page_title) { 'Help' }
		it_should_behave_like "all static pages"
	end

	describe "About page" do
		before { visit about_path }
		let(:heading) { 'About' }
		let(:page_title) { 'About' }
		it_should_behave_like "all static pages"
	end

	describe "Contact page" do
		before { visit contact_path }
		let(:heading) { 'Contact' }
		let(:page_title) { 'Contact' }
		it_should_behave_like "all static pages"
	end

end
