# frozen_string_literal: true

require "test_helper"

class AdminDashboardControllerTest < ActionDispatch::IntegrationTest
  test "should require authentication" do
    get admin_root_url

    assert_redirected_to root_url
  end

  test "should get index" do
    login

    get admin_root_url

    assert_response :success
  end
end
