# frozen_string_literal: true

class ModelViewComponent < ModelComponent
  def initialize(model, head_attr = :name, *attributes)
    super model, head_attr, attributes
    @attributes -= [head_attr]
  end

  def edit_icon
    helpers.icon :pencil, t('actions.edit')
  end

  def delete_icon
    helpers.icon :x, t('actions.remove')
  end
end
