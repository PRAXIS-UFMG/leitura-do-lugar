# frozen_string_literal: true

class ModelViewComponentPreview < ViewComponent::Preview
  def default
    user = User.first
    render ModelViewComponent.new model: user, head_attr: :name
  end
end
