require "uri"

module Admin::MediasHelper
  def link_class(media)
    "media-inline-image #{"button tertiary" unless media.file&.image?}"
  end

  def public_url(media)
    return unless media.present?

    api_public_media_url name: media.name
  end
end
