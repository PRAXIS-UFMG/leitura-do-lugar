module WithErrorFlash
  extend ActiveSupport::Concern

  included do
    after_action :set_error_flash, only: [:create, :update]
  end

  def set_error_flash
    flash[:error] = instance_variable_get("@#{controller_name.singularize}").errors.full_messages
  end
end