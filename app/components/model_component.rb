# frozen_string_literal: true

class ModelComponent < ViewComponent::Base
  def initialize(model, head_attr = :name, attributes = [])
    super
    @model      = model
    @model_name = model.class.name.underscore
    @head_attr  = head_attr
    @attributes = if attributes.any?
                    attributes
                  else
                    model.attribute_names -
                      %w[id created_at updated_at]
                  end
  end

  delegate :back_icon, to: :helpers
  delegate :current_user, to: :helpers

  def user_permitted_to?(action)
    helpers.user_permitted_to? @model, action
  end
end
