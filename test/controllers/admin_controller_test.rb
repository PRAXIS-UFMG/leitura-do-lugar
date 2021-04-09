# frozen_string_literal: true

require 'test_helper'

class AdminController
  def test_route
    head :ok
  end
end

class AdminControllerTest < ActionDispatch::IntegrationTest
  setup do
    Rails.application.routes.draw do
      get 'test' => 'admin#test_route'
    end
  end

  teardown do
    Rails.application.reload_routes!
  end

  test 'requires authentication' do
    get '/test'

    assert_redirected_to %r{public/404.html}
  end
end
