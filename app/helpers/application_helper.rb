# frozen_string_literal: true

module ApplicationHelper
  def icon_tag(name, alt, **attrs)
    # attrs[:class] = "w-6 h-auto #{attrs[:class]}".strip
    tag.svg alt: alt, class: "h-5 w-5", viewBox: "0 0 20 20", fill: "currentColor", **attrs do
      tag.use 'xlink:href': "#icon-#{name}"
    end
  end
end
