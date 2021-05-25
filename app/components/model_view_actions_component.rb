# frozen_string_literal: true

class ModelViewActionsComponent < ModelActionsComponent
  delegate :edit_icon, to: :helpers
  delegate :delete_icon, to: :helpers
end
