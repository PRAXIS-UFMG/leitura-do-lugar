# frozen_string_literal: true

class NavLinkComponent < ViewComponent::Base
  def initialize(label, path)
    super
    @label = label
    @path = path
  end

end
