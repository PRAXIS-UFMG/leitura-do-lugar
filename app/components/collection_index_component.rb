# frozen_string_literal: true

class CollectionIndexComponent < ViewComponent::Base
  def initialize(model, collection, add_icon, *attributes)
    super
    @collection     = collection
    @model          = model
    @add_icon       = add_icon
    @model_name     = @model.name.underscore
    attr_options    = attributes.extract_options!
    @attributes     = attributes + attr_options.keys
    @header_classes = attr_options.transform_values { |opts| opts[:header] }
    @cell_classes   = attr_options.transform_values { |opts| opts[:cell] }
  end

  delegate :current_user, to: :helpers

  def user_permitted_to?(action)
    helpers.user_permitted_to? @model.new, action
  end

  def user_permissions
    @model.new.permissions(current_user)
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
    classes = 'font-normal border-black '
    classes += 'border-r-2 ' unless index == @attributes.size - 1
    classes += if index.positive?
                 'pl-2 '
               else
                 'pr-2 '
               end
    (classes + @header_classes[attr].to_s).strip
  end

  def cell_classes(attr, index)
    classes = ''
    classes += if index.positive?
                 'pl-2 '
               else
                 'pr-2 '
               end
    (classes + @cell_classes[attr].to_s).strip
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
