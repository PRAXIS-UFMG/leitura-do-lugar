# frozen_string_literal: true

class NavLinkComponent < ViewComponent::Base
  def initialize(label, controller)
    super
    @label      = label
    @link_controller = controller
  end

  def call
    tag.li(class: ('font-semibold' if current_page?(controller: @link_controller, action: controller.action_name))) do
      link_to_unless_current @label, { controller: @link_controller, action: :index }
    end
  end
end
