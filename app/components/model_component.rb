# frozen_string_literal: true

class ModelComponent < ViewComponent::Base
  def initialize(model, head_attr = :name, attributes = [])
    super
    @model      = model
    @model_name = model.class.name.underscore
    @head_attr  = head_attr
    @attributes = attributes.presence || (model.attribute_names - %w[id created_at updated_at]).map!(&:to_sym)
  end

  delegate :back_icon, to: :helpers
  delegate :current_user, to: :helpers

  def t_header(attr)
    @model.class.human_attribute_name attr.to_s
  end

  def t_attribute(attr, value = nil)
    value ||= @model[attr]
    if @model.type_for_attribute(attr.to_s).type == :date
      localize value
    else
      translate "activerecord.attributes.#{@model_name}.#{attr}.#{value}", default: value
    end
  end
end
