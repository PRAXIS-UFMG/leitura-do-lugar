class PublicContentController < ApplicationController
  def about_project
    render ContentViewComponent.new title: t("content.#{content}"),
                                    content_model: Content.find_by!(name: content)
  end
end
