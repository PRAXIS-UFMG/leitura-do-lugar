# frozen_string_literal: true

class ViewModelComponent < ViewComponent::Base
  def initialize(entity, head_attr, *attributes)
    super
    @entity      = entity
    @entity_name = @entity.class.name.downcase
    @head_attr   = head_attr
    @attributes  = if attributes.any?
                     attributes
                   else
                     entity.attribute_names -
                       ['id', 'created_at', 'updated_at', head_attr.to_s]
                   end
  end

  def allowed_to?(_action)
    true
  end

  def back_icon
    helpers.icon(:'arrow-left', t('actions.back'))
  end

  def edit_icon
    helpers.icon(:pencil, t('actions.edit'))
  end

  def delete_icon
    helpers.icon(:x, t('actions.remove'))
  end
end
