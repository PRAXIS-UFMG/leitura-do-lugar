# frozen_string_literal: true

class ViewModelComponentPreview < ViewComponent::Preview
  def default
    user = User.new(id: 1, name: 'Ariel', username: 'ariel', admin: true)
    render(ViewModelComponent.new(user, :name))
  end
end
