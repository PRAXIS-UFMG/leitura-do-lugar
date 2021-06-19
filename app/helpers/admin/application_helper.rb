require_relative "../../forms/admin_form_builder"

module Admin
  module ApplicationHelper
    def admin_form_for(model, **options, &block)
      options = options.with_defaults({ html: { class: 'admin-form' }, builder: ::AdminFormBuilder })
      form_for model, **options, &block
    end
  end
end