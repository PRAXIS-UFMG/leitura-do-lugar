# frozen_string_literal: true

class ModelViewComponent < ModelComponent
  def initialize(model, head_attr = :name, *attributes)
    super model, head_attr, attributes
    @attributes -= [head_attr]
  end

  def attr_type(attr)
    case @model.public_send(attr)
    when Article
      :article
    when ActiveStorage::Attached
      :file
    else
      @model.class.type_for_attribute(attr.to_s).type
    end
  end

  def download_icon
    helpers.icon :download, "Download"
  end
end
