# frozen_string_literal: true

module AdminHelper
  # @param [ApplicationRecord] model
  # @param [Symbol] action
  def user_permitted_to?(model, action)
    model.permitted_to?(current_user, action)
  end
end
