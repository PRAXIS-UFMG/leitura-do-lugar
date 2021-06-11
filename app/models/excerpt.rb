class Excerpt < ApplicationRecord
  attribute :text
  attribute :approved, :boolean

  belongs_to :report
  has_many_media

  def name
    "Trecho ##{id}: #{report.name}"
  end
end
