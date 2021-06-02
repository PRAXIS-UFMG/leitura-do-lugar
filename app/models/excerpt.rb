class Excerpt < ApplicationRecord
  attribute :text
  attribute :approved, :boolean

  belongs_to :report

  def name
    "Trecho ##{id}: #{report.name}"
  end
end
