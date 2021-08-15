require 'uri'

module Admin::MediasHelper
  def public_url(media, download: false)
    api_public_media_url name: media.name, download: download
  end
end
