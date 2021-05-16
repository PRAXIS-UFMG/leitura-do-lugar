# frozen_string_literal: true

class ContentViewComponent < ViewComponent::Base
  def initialize(title:, content_model:)
    @title = title
    @text  = content_model.text_md
  end
end
