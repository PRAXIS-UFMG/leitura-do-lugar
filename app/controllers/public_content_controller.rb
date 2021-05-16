class PublicContentController < ApplicationController
  Content::NAMES.each_key do |content|
    define_method content do
      render ContentViewComponent.new title: t("content.#{content}"),
                                      content_model: Content.find_by!(name: content)
    end
  end
end
