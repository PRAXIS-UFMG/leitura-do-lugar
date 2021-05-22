class Media < ApplicationRecord
  attribute :name
  attribute :description
  attribute :description_md

  has_one_attached :file

  validates :name, presence: true, uniqueness: true
end
