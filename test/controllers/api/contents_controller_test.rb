require "test_helper"

class Api::ContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_contents_show_url
    assert_response :success
  end
end
