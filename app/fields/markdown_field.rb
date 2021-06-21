require "administrate/field/base"

class MarkdownField < Administrate::Field::Base
  def to_s
    resource.article_rendered
  end

  def owner
    resource.id
  end

  def excerptable?
    @options[:excerptable] == true
  end

  def self.permitted_attribute(attr, _options = nil)
    { article_attributes: [:markdown, :rendered] }
  end
end
