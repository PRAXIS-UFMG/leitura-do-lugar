# frozen_string_literal: true

require 'test_helper'

class ModelViewComponentTest < ViewComponent::TestCase
  test 'renders correct default attributes' do
    user = users :common
    with_controller_class AdminController do
      controller.session['user_id'] = user.id

      render_inline ModelViewComponent.new user

      assert_text 'Username'
      assert_text 'Nome'
      assert_text 'Admin'
    end
  end

  test 'respects user permissions' do
    user = users :common
    with_controller_class AdminController do
      controller.session['user_id'] = user.id

      render_inline ModelViewComponent.new users(:admin)

      assert_no_selector 'svg[alt="Editar"]'
    end
  end
end
