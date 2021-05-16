require "test_helper"

class ContentPublicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @content_public = content_publics(:one)
  end

  test "should get index" do
    get content_publics_url
    assert_response :success
  end

  test "should get new" do
    get new_content_public_url
    assert_response :success
  end

  test "should create content_public" do
    assert_difference('ContentPublic.count') do
      post content_publics_url, params: { content_public: {  } }
    end

    assert_redirected_to content_public_url(ContentPublic.last)
  end

  test "should show content_public" do
    get content_public_url(@content_public)
    assert_response :success
  end

  test "should get edit" do
    get edit_content_public_url(@content_public)
    assert_response :success
  end

  test "should update content_public" do
    patch content_public_url(@content_public), params: { content_public: {  } }
    assert_redirected_to content_public_url(@content_public)
  end

  test "should destroy content_public" do
    assert_difference('ContentPublic.count', -1) do
      delete content_public_url(@content_public)
    end

    assert_redirected_to content_publics_url
  end
end
