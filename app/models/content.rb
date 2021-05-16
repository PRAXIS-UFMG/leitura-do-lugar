class Content < ApplicationRecord
  NAMES = %i[about_project team_and_aid].each_with_object({}) { |i, obj| obj[i] = i.to_s }
  enum name: NAMES

  attribute :name
  attribute :text
  attribute :text_md

  validates :name, presence: true
  validates :name, uniqueness: true

  def name_human
    I18n.t "activerecord.attributes.content.name.#{name}"
  end
end
