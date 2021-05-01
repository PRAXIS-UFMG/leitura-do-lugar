# frozen_string_literal: true

class ModelFormComponentPreview < ViewComponent::Preview
  def default
    render ModelFormComponent.new(model: User.new)
  end

  def line_analyses
    render ModelFormComponent.new(model: LineAnalysis.new)
  end
end
