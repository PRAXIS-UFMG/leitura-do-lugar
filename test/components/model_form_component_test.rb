# frozen_string_literal: true

require 'test_helper'

class ModelFormComponentTest < ViewComponent::TestCase
  test 'renders correct default attributes' do
    render_inline ModelFormComponent.new User.new

    assert_text 'Username'
    assert_text 'Nome'
    assert_text 'Admin'
    assert_no_text 'Senha'
  end

  test 'correctly renders boolean attributes as checkbox' do
    render_inline ModelFormComponent.new User.new, :name, :admin

    assert_selector 'input[type="checkbox"]'
  end

  test 'correctly renders Enum columns' do
    render_inline ModelFormComponent.new LineAnalysis.new, :name, line_type: { as: :enum }

    assert_selector 'select'
  end

  test 'correctly renders ActiveText columns' do
    skip_until(2021, 5, 4, '0.1.0')
  end
end
