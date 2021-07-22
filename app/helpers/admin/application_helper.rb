module Admin::ApplicationHelper
  def nested_media_field(media, field, **options)
    owner_prefix = media.owner_type.downcase
    name = "#{owner_prefix}[medias][][#{field}]"
    hidden_field_tag name, media.public_send(field), options
  end
end
