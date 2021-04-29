# frozen_string_literal: true

class ModelFormComponent < ModelComponent

  def show_icon
    helpers.icon(:eye, t('actions.show'))
  end

  def confirm_icon
    helpers.icon(:check, t('actions.confirm'))
  end
end
