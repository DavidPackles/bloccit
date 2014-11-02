source 'https://rubygems.org'

# Rails
gem 'rails', '4.1.5'

group :production do
   gem 'pg'
   gem 'rails_12factor'
   gem 'unicorn'
 end

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

group :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'capybara'
end

# Preinstalled gems
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jbuilder', '~> 2.0'
gem 'turbolinks'
gem 'jquery-rails'

# Bootstrap
gem 'bootstrap-sass', '~> 3.1.1'

# Other gems

# User authentication and authorization
gem 'devise'
gem 'pundit'

# Secret Variables
gem 'figaro'

# Seed Data
gem 'faker'

# Input gems
gem 'simple_form'
gem 'redcarpet'

# Avatars & images
gem 'carrierwave'
gem 'mini_magick'
gem 'fog'

# Pagination
gem 'will_paginate', '~> 3.0.5'

# Performance monitoring
gem 'newrelic_rpm'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc



# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development
