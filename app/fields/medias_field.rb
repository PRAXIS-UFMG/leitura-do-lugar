require "administrate/field/base"

class MediasField < Administrate::Field::Base
  def owner
    @resource
  end

  def build_medias
    @resource.medias.build
  end

  def self.permitted_attribute(attr, _options = nil)
    { media_ids: [] }
  end
end
