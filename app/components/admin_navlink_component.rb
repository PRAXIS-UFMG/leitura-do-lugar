# frozen_string_literal: true

class AdminNavlinkComponent < ViewComponent::Base
  def initialize(label:, controller:)
    super
    @label = label
    @link_controller = controller
  end

  def call
    is_current = current_page?(controller: @link_controller, action: controller.action_name)
    link_to_unless is_current, @label, {controller: @link_controller, action: :index} do
      tag.span @label, class: "font-semibold cursor-default"
    end
  end
end
