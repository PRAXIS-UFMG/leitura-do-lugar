# frozen_string_literal: true

class ModelActionsComponent < ViewComponent::Base
  delegate :back_icon, to: :helpers

  def initialize(model)
    @model = model
    @model_name = model.class.name.underscore
  end

  def index_path
    return send("#{@model_name}_index_path") if respond_to?"#{@model_name}_index_path"
    send("#{@model_name.pluralize}_path")
  end
end
