module MediasHelper
  def owner_medias(media)
    owner_name = media.owner_type.downcase.to_sym
    "#{owner_name}[media_ids][]"
  end
end
