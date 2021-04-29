# frozen_string_literal: true

class ModelViewComponent < ModelComponent
  def initialize(model:, head_attr: :name, attributes: [])
    super model: model, head_attr: head_attr, attributes: (attributes - [head_attr.to_s])
  end

  def edit_icon
    helpers.icon(:pencil, t('actions.edit'))
  end

  def delete_icon
    helpers.icon(:x, t('actions.remove'))
  end
end
