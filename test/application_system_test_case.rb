# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1280, 720]

  def login(username = users(:two).username, pass = 'testpassword')
    visit login_url
    fill_in 'session_username', with: username
    fill_in 'session_password', with: pass
    click_button 'entrar'
    assert_current_path '/admin/users'
  end

  def click_icon(alt)
    first("svg[alt='#{alt}']").click
  end
end
