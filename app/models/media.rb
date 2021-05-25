class Media < ApplicationRecord
  attribute :name
  attribute :description

  has_one_attached :file

  validates :name, presence: true, uniqueness: true
end
