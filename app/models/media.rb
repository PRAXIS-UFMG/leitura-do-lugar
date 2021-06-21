class Media < ApplicationRecord
  attribute :name
  attribute :description
  attribute :inline, :boolean

  include FileUploader::Attachment :file
  belongs_to :owner, polymorphic: true, optional: true

  validates :name, presence: true, uniqueness: true

  before_validation :set_name

  def set_name
    self.name ||= file.metadata["filename"].split(".")[0..]
  end
end
