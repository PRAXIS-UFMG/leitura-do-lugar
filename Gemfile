# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1"
# Use PostgreSQL as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "puma", "~> 5.0"
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "6.0.0.beta.7"
# Use Active Model has_secure_password
gem "bcrypt", "~> 3.1.7"
# A lightweight templating engine for Ruby
gem "slim-rails"
# A framework for building reusable, testable & encapsulated view components
gem "view_component", "~> 2.31", require: "view_component/engine"
# Track changes to your rails models
gem "paper_trail", "~> 12.0"
gem "geocoder", "~> 1.6"
gem "shrine", "~> 3.0"
gem "image_processing", "~> 1.12"
gem "redis"
gem "turbo-rails", "~> 0.5"

gem "rack-timeout"
gem "rails-i18n", "~> 6.0.0"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  gem "i18n-debug"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Ruby Style Guide, with linter & automatic code fixer
  gem "standard"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "web-console", ">= 4.1.0"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
end

group :test do
  # Used to be bundled with ruby
  gem "rexml"
  # Code coverage for Ruby
  gem "simplecov", require: false
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
