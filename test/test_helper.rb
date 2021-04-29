# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    # parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
    # Add more helper methods to be used by all tests here...
    def login(username = users(:common).username, pass = 'testpassword')
      post login_url, params: { session: { username: username, password: pass } }
    end
  end
end
