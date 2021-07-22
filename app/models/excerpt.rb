class Excerpt < ApplicationRecord
  attribute :text
  attribute :approved, :boolean

  belongs_to :report, optional: false
  has_and_belongs_to_many :line_analyses
  has_many_media
  has_markdown_article

  validates :line_analyses, presence: false

  def name
    "Trecho ##{id}: #{report.name}"
  end
end
