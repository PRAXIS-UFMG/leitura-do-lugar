# frozen_string_literal: true

class ModelFormActionsComponent < ModelActionsComponent
  delegate :show_icon, to: :helpers

  def confirm_icon
    helpers.icon(:check, t("actions.confirm"))
  end
end
