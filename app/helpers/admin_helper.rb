module AdminHelper
  include ApplicationHelper

  def admin_form_for(model, **options, &block)
    options.with_defaults!({ html: { class: "admin-form" }, id: dom_id(model) })
    form_for model, **options, builder: AdminFormBuilder, &block
  end
end

class AdminFormBuilder < ActionView::Helpers::FormBuilder
  def labelled_field(method, field)
    label method do |l|
      @template.content_tag(:p, l.translation) + field
    end
  end

  def media_ids_field
    @template.turbo_frame_tag "media_ids", class: "hidden"
  end

  def text_field(method, options = {})
    labelled_field method, super(method, options)
  end

  def text_area(method, options = {})
    options.with_defaults! rows: 2
    labelled_field method, super(method, options)
  end

  def date_field(method, options = {})
    labelled_field method, super(method, options)
  end

  def check_box(method, options = {})
    @template.content_tag :div, class: "flex items-center" do |t|
      label method do |l|
        @template.content_tag(:span, l.translation, class: "mr-3") + super
      end
    end
  end

  def select(method, choices = nil, options: {}, html_options: {}, &block)
    html_options.with_defaults! class: "select"
    if choices.nil?
      choices = I18n.t("activerecord.attributes.#{@object_name}.#{method}").except(:one).invert
    end
    labelled_field method, super(method, choices, options, html_options, &block)
  end

  def year_select(method)
    labelled_field method, number_field(method, value: Date.today.year, step: 1, in: 1900..Date.today.year)
  end
end