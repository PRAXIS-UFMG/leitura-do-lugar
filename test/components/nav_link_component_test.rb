# frozen_string_literal: true

require "test_helper"

class NavLinkComponentTest < ViewComponent::TestCase
  test "renders normal link" do
    render_inline AdminNavlinkComponent.new "Section #1", "/section1"

    assert_xpath '//a[@href="/section1"]', text: "Section #1"
  end

  test "renders current path as inactive" do
    with_request_url Rails.application.routes.url_helpers.user_path(1) do
      render_inline AdminNavlinkComponent.new "Users", Rails.application.routes.url_helpers.users_path

      assert_selector "li", text: "Users"
    end
  end
end
