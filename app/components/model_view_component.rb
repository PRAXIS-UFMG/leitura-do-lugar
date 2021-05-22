# frozen_string_literal: true

class ModelViewComponent < ModelComponent
  def initialize(model, head_attr = :name, *attributes)
    super model, head_attr, attributes
    @attributes -= [head_attr]
  end

  def attr_type(attr)
    return :file if @model.respond_to?(attr) && @model.public_send(attr).is_a?(ActiveStorage::Attached)
    @model.class.type_for_attribute(attr.to_s).type
  end

  def download_icon
    helpers.icon :download, "Download"
  end

  def edit_icon
    helpers.icon :pencil, t("actions.edit")
  end

  def delete_icon
    helpers.icon :x, t("actions.remove")
  end
end
