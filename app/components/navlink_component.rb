# frozen_string_literal: true

class NavlinkComponent < ViewComponent::Base
  def initialize(label:, path:)
    @label = label
    @path = path
  end

  def call
    link_to_unless_current @label, @path do
      tag.span @label, class: "font-semibold cursor-default"
    end
  end
end
