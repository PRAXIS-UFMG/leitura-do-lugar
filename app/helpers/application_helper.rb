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

  def show_icon
    icon(:eye, t("actions.show"))
  end

  def edit_icon
    icon :pencil, t("actions.edit")
  end

  def delete_icon
    icon :x, t("actions.remove")
  end

  def download_icon
    icon :download, "Download"
  end
end
