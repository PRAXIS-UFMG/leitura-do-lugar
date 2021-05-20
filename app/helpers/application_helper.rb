# frozen_string_literal: true

module ApplicationHelper
  def icon(name, alt, **attrs)
    attrs[:class] = "w-6 h-auto #{attrs[:class]}".strip
    tag.svg alt: alt, xmlns: "http://www.w3.org/2000/svg", fill: "none", viewBox: "0 0 24 24", stroke: "currentColor",
            **attrs do
      raw File.open("app/packs/images/icons/#{name}.svg", "rb").read
    end
  end

  def back_icon
    icon(:'arrow-left', t("actions.back"))
  end
end
