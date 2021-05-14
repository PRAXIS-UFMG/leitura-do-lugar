# frozen_string_literal: true

class CollectionIndexComponent < ModelComponent
  def initialize(model, collection, add_icon, *attributes)
    attr_options = attributes.extract_options!
    super model.new, nil, (attributes + attr_options.keys)
    @collection     = collection
    @add_icon       = add_icon
    @header_classes = attr_options.transform_values { |opts| opts[:header] }
    @cell_classes   = attr_options.transform_values { |opts| opts[:cell] }
  end

  def user_permissions
    @model.permissions(current_user)
  end

  def header_classes(attr, index)
    classes = base_classes index
    classes += 'font-normal border-black '
    classes += 'border-r-2 ' if index < @attributes.size - 1
    (classes + @header_classes[attr].to_s).strip
  end

  def cell_classes(attr, index)
    classes = base_classes(index)
    (classes + @cell_classes[attr].to_s).strip
  end

  def base_classes(index)
    classes = ''
    classes += 'pl-2 ' if index.positive?
    classes += 'pr-2 ' if index < @attributes.size - 1
    classes
  end

  def dropdown_icon
    icon :'chevron-left', 'Ações'
  end

  def add_icon
    icon @add_icon, t('actions.create', model: @model.class.lowercase_human_name), class: 'mx-auto'
  end

  def show_icon
    icon :eye, t('actions.show')
  end

  def edit_icon
    icon :pencil, t('actions.edit')
  end

  def remove_icon
    icon :x, t('actions.remove')
  end
end
