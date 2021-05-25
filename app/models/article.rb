class Article < ApplicationRecord
  attribute :markdown
  attribute :rendered

  has_many_attached :medias
end
