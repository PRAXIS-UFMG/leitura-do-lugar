# frozen_string_literal: true

class ModelFormComponent < ModelComponent
  def initialize(model, head_attr = :name, *attributes)
    @attr_options = attributes.extract_options!
    super model, head_attr, attributes + @attr_options.keys
  end

  # @return [Symbol]
  def attr_type(attr)
    supplied_type = @attr_options.dig(attr, :as)
    return supplied_type if supplied_type

    @model.class.type_for_attribute(attr.to_s).type
  end

  # @return [Array]
  def attr_select(attr)
    values = @attr_options.dig(attr, :values)
    return values.map { |v| [t("activerecord.attributes.#{@model_name}.#{attr}.#{v}"), v] } if values

    t("activerecord.attributes.#{@model_name}.#{attr}").to_a.reject { |i| i.first == :one }.map(&:reverse)
  end
end
