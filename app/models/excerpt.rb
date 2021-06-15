class Excerpt < ApplicationRecord
  attribute :text
  attribute :approved, :boolean

  belongs_to :report
  has_many_media
  has_markdown_article

  def name
    "Trecho ##{id}: #{report.name}"
  end
end
