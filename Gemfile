source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use Haml as the templating library
gem 'haml'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'devise'
gem 'factory_girl_rails'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'bcrypt-ruby', '~> 3.0.0', :require => "bcrypt"

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'jquery-rails'

# Build google map API
gem 'gmaps4rails'

# Build nice-looking UIs
gem 'bootstrap'

# Access rails routes by javascript
gem "js-routes"

gem 'pg'



group :development, :test do
	# Call 'byebug' anywhere in the code to stop execution and get a debugger console
	gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
	# Use sqlite3 as the database for Active Record

	gem 'sqlite3'
end

group :development do
	# Access an interactive console on exception pages or by calling 'console' anywhere in the code.
	gem 'web-console', '>= 3.3.0'
	gem 'listen', '>= 3.0.5', '< 3.2'
	# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
	gem 'spring'
	gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
	# Adds support for Capybara system testing and selenium driver
	gem 'selenium-webdriver'
	# Easy installation and use of chromedriver to run system tests with Chrome
	gem 'chromedriver-helper'
	gem 'rspec-rails', '3.7.2'
	gem 'cucumber-rails-training-wheels'
  	gem 'simplecov', :require => false
  	gem 'cucumber-rails', :require => false
  	gem 'rails-controller-testing'
  	gem 'capybara', '~> 2.8'
  	gem 'launchy'
  	gem 'ZenTest', '4.11.0'
  	gem 'factory_girl', '~> 2.2'
  	gem 'webrat'
  	gem 'database_cleaner', '1.4.1'
end

group :production do
	gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
# send letter locally
gem "letter_opener", :group => :development
gem 'fullcalendar-rails'
gem 'simple_form'
gem 'bootstrap-sass', '~> 3.3.5'
gem 'faker'
gem 'momentjs-rails', '>= 2.9.0'
# erb to haml
gem "haml-rails", "~> 1.0"
