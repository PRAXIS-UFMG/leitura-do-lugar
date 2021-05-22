# frozen_string_literal: true

class IndexActionsDropdownComponent < ViewComponent::Base
  def initialize(model, show: nil, edit: nil, remove: nil)
    @model  = model
    @show   = show
    @edit   = edit
    @remove = remove
  end

  def dropdown_icon
    helpers.icon :'chevron-left', "Ações"
  end

  def show_icon
    helpers.icon :eye, t("actions.show")
  end

  def edit_icon
    helpers.icon :pencil, t("actions.edit")
  end

  def remove_icon
    helpers.icon :x, t("actions.remove")
  end
end
