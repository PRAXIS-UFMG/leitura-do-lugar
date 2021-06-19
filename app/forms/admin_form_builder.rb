class AdminFormBuilder < ActionView::Helpers::FormBuilder
  def labelled_field(method, field)
    label method do |l|
      @template.content_tag(:p, l.translation) + field
    end
  end

  def markdown_field
    label :article, data: { controller: 'markdown-editor', 'markdown-editor-model-value': @object_name } do |l|
      @template.content_tag(:p, l.translation) +
        fields_for(:article, builder: ActionView::Helpers::FormBuilder) do |article_form|
          article_form.hidden_field(:rendered, data: { 'markdown-editor-target': 'mdField' }) +
            article_form.text_area(:markdown, data: { 'markdown-editor-target': 'editorField' })
        end
    end
  end

  def text_field(method, options = {})
    labelled_field method, super(method, options)
  end

  def email_field(method, options = {})
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
    @template.content_tag :div, class: 'flex items-center' do |t|
      label method do |l|
        @template.content_tag(:span, l.translation, class: 'mr-3') + super
      end
    end
  end

  def file_field(method, options = {})
    labelled_field method, super
  end

  def select(method, choices = nil, options: {}, html_options: {}, &block)
    html_options.with_defaults! class: 'select'
    if choices.nil?
      choices = I18n.t("activerecord.attributes.#{@object_name}.#{method}").except(:one).invert
    end
    labelled_field method, super(method, choices, options, html_options, &block)
  end

  def year_select(method)
    labelled_field method, number_field(method, value: Date.today.year, step: 1, in: 1900..Date.today.year)
  end
end