# frozen_string_literal: true

class CollectionIndexComponent < ModelComponent
  def initialize(model, collection, add_icon, *attributes)
    attr_options = attributes.extract_options!
    super model.new, nil, attributes + attr_options.keys
    @collection     = collection
    @add_icon       = add_icon
    @header_classes = attr_options.transform_values { |opts| opts[:header] }
    @cell_classes   = attr_options.transform_values { |opts| opts[:cell] }
  end

  def user_permissions
    @model.permissions(current_user)
  end

  def t_header(attr)
    txt_or_hash = t "activerecord.attributes.#{@model_name}.#{attr}"
    if txt_or_hash.is_a? Hash
      txt_or_hash[:one]
    else
      txt_or_hash
    end
  end

  def t_attribute(attr, value)
    translate "activerecord.attributes.#{@model_name}.#{attr}.#{value}", default: value
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
    icon :'chevron-left', 'Ações', 'data-dropdown-target': 'toggle'
  end

  def add_icon
    icon @add_icon, t('actions.create', model: @model_name), 'mx-auto'
  end

  def show_icon(klass = nil)
    icon :eye, t('actions.show'), klass
  end

  def edit_icon(klass = nil)
    icon :pencil, t('actions.edit'), klass
  end

  def remove_icon(klass = nil)
    icon :x, t('actions.remove'), klass
  end

  private

  def icon(icon, alt, klass = nil)
    helpers.icon icon, alt, class: klass
  end
end
