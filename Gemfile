source 'http://rubygems.org'

gem 'rails', '3.1.10'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
#  gem 'sass-rails', "  ~> 3.1.0.rc"
#  gem 'coffee-rails', "~> 3.1.0.rc"
#  gem 'uglifier'
end

gem 'jquery-rails'

gem 'mysql2', "~> 0.3.11"
gem 'high_voltage'
gem 'simple_form'
gem "ckeditor", "~> 3.6.0"
gem 'cloudfiles'
gem 'cocaine' #a dependency that paperclilp didn't pick up yet
gem "paperclip-cloudfiles", :require => 'paperclip'
#gem 'paperclip'
gem 'devise', "~> 2.0.2"
gem 'cancan', '1.6.0'
gem 'bcrypt-ruby'
gem 'RedCloth'
gem 'acts_as_list'
gem 'kaminari'
gem 'thinking-sphinx'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
group :test do
  gem 'cucumber-rails'
  gem 'cucumber'
end

group :test, :development do
  gem 'factory_girl_rails', '~> 1.0.1'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem "shoulda", :require => false
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
end