source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
# Use Twitter's Bootstrap web design (CSS/Sass) framework
gem 'bootstrap-sass', '2.3.2.0'
# State-of-the-art password encryption
gem 'bcrypt-ruby', '3.0.1'

group :development, :test do
# RSpec is test automation (replacement for Test::Spec)
	gem 'rspec-rails', '2.13.1'
# Guard automatically runs your specs as-needed
	gem 'guard-rspec', '2.5.0' 
# required for Guard
	gem 'libnotify', '0.8.0' 
# Use sqlite3 as the database for Active Record
	gem 'sqlite3', '1.3.8'
# Speed up test spin-up with Spork / childprocesses
	gem 'spork-rails', '4.0.0'
	gem 'guard-spork', '1.5.0'
	gem 'childprocess', '0.3.9'
end

group :test do
	gem 'selenium-webdriver', '2.35.1'
	gem 'capybara', '2.1.0'
# Helper to RSpec; specialized for defining Active Record objects
	gem 'factory_girl_rails', '4.2.1'
end

group :doc do
	# bundle exec rake doc:rails generates the API under doc/api.
	gem 'sdoc', '0.3.20', require: false
end

group :production do
	gem 'pg', '0.15.1'
	gem 'rails_12factor', '0.0.2'
end

# SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
# Uglifier compresses JavaScript assets
gem 'uglifier', '2.1.1'
# CoffeeScript provides .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# jquery as the JavaScript library
gem 'jquery-rails', '3.0.4'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '1.1.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '1.0.2'
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'
# unicorn as the app server
# gem 'unicorn'
# Capistrano for deployment
# gem 'capistrano', group: :development
# debugger
# gem 'debugger', group: [:development, :test]
