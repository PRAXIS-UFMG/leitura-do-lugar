# frozen_string_literal: true

class ComponentPreviewController < ViewComponentsController
  before_action :set_user
  helper_method :current_user

  attr_reader :current_user

  private

  def set_user
    @current_user = User.find_by(admin: true)
  end
end
