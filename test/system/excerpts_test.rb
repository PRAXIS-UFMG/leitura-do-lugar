require "application_system_test_case"

class ExcerptsTest < ApplicationSystemTestCase
  setup do
    @excerpt = excerpts(:one)
  end

  test "visiting the index" do
    visit excerpts_url
    assert_selector "h1", text: "Excerpts"
  end

  test "creating a Excerpt" do
    visit excerpts_url
    click_on "New Excerpt"

    check "Approved" if @excerpt.approved
    fill_in "End", with: @excerpt.end
    fill_in "Report", with: @excerpt.report_id
    fill_in "Start", with: @excerpt.start
    click_on "Create Excerpt"

    assert_text "Excerpt was successfully created"
    click_on "Back"
  end

  test "updating a Excerpt" do
    visit excerpts_url
    click_on "Edit", match: :first

    check "Approved" if @excerpt.approved
    fill_in "End", with: @excerpt.end
    fill_in "Report", with: @excerpt.report_id
    fill_in "Start", with: @excerpt.start
    click_on "Update Excerpt"

    assert_text "Excerpt was successfully updated"
    click_on "Back"
  end

  test "destroying a Excerpt" do
    visit excerpts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Excerpt was successfully destroyed"
  end
end
