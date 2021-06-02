require "test_helper"

class ExcerptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @excerpt = excerpts(:one)
  end

  test "should get index" do
    get excerpts_url
    assert_response :success
  end

  test "should get new" do
    get new_excerpt_url
    assert_response :success
  end

  test "should create excerpt" do
    assert_difference("Excerpt.count") do
      post excerpts_url, params: {excerpt: {approved: @excerpt.approved, end: @excerpt.end, report_id: @excerpt.report_id, start: @excerpt.start}}
    end

    assert_redirected_to excerpt_url(Excerpt.last)
  end

  test "should show excerpt" do
    get excerpt_url(@excerpt)
    assert_response :success
  end

  test "should get edit" do
    get edit_excerpt_url(@excerpt)
    assert_response :success
  end

  test "should update excerpt" do
    patch excerpt_url(@excerpt), params: {excerpt: {approved: @excerpt.approved, end: @excerpt.end, report_id: @excerpt.report_id, start: @excerpt.start}}
    assert_redirected_to excerpt_url(@excerpt)
  end

  test "should destroy excerpt" do
    assert_difference("Excerpt.count", -1) do
      delete excerpt_url(@excerpt)
    end

    assert_redirected_to excerpts_url
  end
end
