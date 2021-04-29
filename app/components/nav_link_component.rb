# frozen_string_literal: true

class NavLinkComponent < ViewComponent::Base
  def initialize(label, path)
    super
    @label = label
    @path  = path
  end

  def call
    tag.li(class: ('font-semibold' if current_page?(@path))) do
      link_to_unless_current @label, @path
    end
  end
end
