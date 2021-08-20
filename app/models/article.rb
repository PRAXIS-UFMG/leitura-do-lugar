class Article < ApplicationRecord
  attribute :markdown
  attribute :rendered

  has_many_media
  belongs_to :owner, polymorphic: true
end
