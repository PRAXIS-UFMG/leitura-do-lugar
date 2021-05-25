class Content < ApplicationRecord
  NAMES = %i[about_project team_and_aid].each_with_object({}) { |i, obj| obj[i] = i.to_s }.freeze
  enum name: NAMES

  include MarkdownText

  validates :name, presence: true, uniqueness: true

  def self.all_taken_names
    all.pluck(:name)
  end
end
