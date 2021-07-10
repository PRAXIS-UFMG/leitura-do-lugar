class Content < ApplicationRecord
  has_markdown_article

  validates :slug, uniqueness: true
  validates :slug, :title, presence: true
end
