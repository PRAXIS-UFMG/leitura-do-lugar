require "administrate/field/base"

class MediasField < Administrate::Field::Base
  def owner
    @resource
  end

  def build_medias
    @resource.medias.build
  end

  def self.permitted_attribute(attr, _options = nil)
    { medias_attributes: [:id, :_destroy, :name, :file, :owner_type, :owner_id] }
  end
end
