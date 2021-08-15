require 'uri'

class ShrineDownloadableField < Administrate::Field::Shrine
  include Rails.application.routes.url_helpers

  def url
    api_public_media_url name: resource.name
  end

  def to_partial_path
    "/fields/#{self.class.superclass.field_type}/#{page}"
  end
end