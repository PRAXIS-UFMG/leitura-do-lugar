require "administrate/field/base"

class MarkdownField < Administrate::Field::Base
  def to_s
    resource.article_rendered
  end

  def truncated
    resource.article_markdown.remove(/[^[:alnum:][:space:]]/).strip.truncate(50)
  end

  def owner
    resource.id
  end

  def highlightable?
    options[:highlightable] == true
  end

  def can_include_medias?
    options[:can_include_medias] == true
  end

  def self.permitted_attribute(attr, _options = nil)
    {article_attributes: [:id, :markdown, :rendered, medias_attributes: [:id, :_destroy, :name, :file, :owner_type, :owner_id]]}
  end
end
