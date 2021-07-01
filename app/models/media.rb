
class Media < ApplicationRecord
  attribute :name
  attribute :description
  attribute :inline, :boolean

  include MediaUploader::Attachment :file
  belongs_to :owner, polymorphic: true, optional: true

  validates :name, presence: true, uniqueness: true

  before_validation :set_name
  after_save :promote_file

  private

  def set_name
    self.name ||= file.metadata["filename"].split(".")[0..]
  end

  def promote_file
    if owner_id && file_attacher.cached?
      file_attacher.promote_to_store
    end
  end
end
