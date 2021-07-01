module Admin::ApplicationHelper
  def nested_media_id_field(owner, id)
    name = "#{owner.downcase.to_sym}[media_ids][]"
    hidden_field_tag name, id
  end
end
