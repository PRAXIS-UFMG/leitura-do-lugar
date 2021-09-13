# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.1"

# Full-stack web application framework.
# (https://rubyonrails.org)
gem "rails", "~> 6.1"
# generate JSON objects with a Builder-style DSL
# https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11'
# Common locale data and translations for Rails i18n.
# (http://github.com/svenfuchs/rails-i18n)
gem "rails-i18n", "~> 6.0.0"
# Use PostgreSQL as the database for Active Record
gem "pg"
# Use Puma as the app server
gem "puma", "~> 5.0"
# Use webpack to manage app-like JavaScript modules in Rails
# (https://github.com/rails/webpacker)
gem "webpacker", "6.0.0.beta.7"
# OpenBSD's bcrypt() password hashing algorithm. For use with Active Model has_secure_password
# (https://github.com/codahale/bcrypt-ruby)
gem "bcrypt", "~> 3.1.7"
# A lightweight templating engine for Ruby
# (https://github.com/slim-template/slim-rails)
gem "slim-rails"
# Track changes to your models.
# (https://github.com/paper-trail-gem/paper_trail)
gem "paper_trail", "~> 12.0"
# Complete geocoding solution for Ruby. (http://www.rubygeocoder.com)
gem "geocoder", "~> 1.6"
# Toolkit for file attachments in Ruby applications
# (https://shrinerb.com)
gem "shrine", "~> 3.0"
# High-level wrapper for processing images for the web with ImageMagick or libvips.
# (https://github.com/janko/image_processing)
gem "image_processing", "~> 1.12"
# Rails authentication with email & password.
# (https://github.com/thoughtbot/clearance)
gem "clearance", "~> 2.5"
# A Rails engine for creating super-flexible admin dashboards
# (https://administrate-demo.herokuapp.com/)
gem "administrate", "~> 0.16"
# Turbo gives you the speed of a single-page web application without having to write any JavaScript
# (https://github.com/hotwired/turbo-rails)
gem "turbo-rails", "~> 0.5.12"
# Cocoon makes it easier to handle nested forms.
# (https://github.com/nathanvda/cocoon)
gem "cocoon", "~> 1.2"

# Error reports you can be happy about.
# (https://github.com/honeybadger-io/honeybadger-ruby)
gem "honeybadger", "~> 4.0"

# Abort requests that are taking too long
# (https://github.com/sharpstone/rack-timeout)
gem "rack-timeout"

# Reduces boot times through caching; required in config/boot.rb
# (https://github.com/Shopify/bootsnap)
gem "bootsnap", ">= 1.4.4", require: false

group :development, :test do
  # Ever wondered which translations are being looked up by Rails, a gem, or simply your app? Wonder no more! (https://github.com/fphilipe/i18n-debug)
  gem "i18n-debug"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # (https://github.com/deivid-rodriguez/byebug)
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Ruby Style Guide, with linter & automatic code fixer
  # (https://github.com/testdouble/standard)
  gem "standard"
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # (https://github.com/rails/web-console)
  gem "web-console", ">= 4.1.0"
  # Listen to file modifications
  # (https://github.com/guard/listen)
  gem "listen", "~> 3.3"
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "rack-mini-profiler", "~> 2.0"
  # Spring speeds up development by keeping your application running in the background.
  # (https://github.com/rails/spring)
  gem "spring"
end

group :test do
  # Used to be bundled with ruby
  # (https://github.com/ruby/rexml)
  gem "rexml"
  # Code coverage for Ruby
  # (https://github.com/simplecov-ruby/simplecov)
  gem "simplecov", require: false
  # Adds support for Capybara system testing and selenium driver
  # (https://github.com/teamcapybara/capybara)
  gem "capybara", ">= 3.26"
  # The next generation developer focused tool for automated testing of webapps
  # (https://github.com/SeleniumHQ/selenium)
  gem "selenium-webdriver"
  # Easy installation and use of web drivers to run system tests with browsers
  # (https://github.com/titusfortner/webdrivers)
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# TODO: substituir por fork e adicionar previews
gem "administrate-field-shrine", "~> 0.0.5"
