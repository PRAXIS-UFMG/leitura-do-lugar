require "application_system_test_case"

class ContentPublicsTest < ApplicationSystemTestCase
  setup do
    @content_public = content_publics(:one)
  end

  test "visiting the index" do
    visit content_publics_url
    assert_selector "h1", text: "Content Publics"
  end

  test "creating a Content public" do
    visit content_publics_url
    click_on "New Content Public"

    click_on "Create Content public"

    assert_text "Content public was successfully created"
    click_on "Back"
  end

  test "updating a Content public" do
    visit content_publics_url
    click_on "Edit", match: :first

    click_on "Update Content public"

    assert_text "Content public was successfully updated"
    click_on "Back"
  end

  test "destroying a Content public" do
    visit content_publics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Content public was successfully destroyed"
  end
end
