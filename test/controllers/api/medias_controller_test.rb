require "test_helper"

class Api::MediasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_medias_show_url
    assert_response :success
  end
end
