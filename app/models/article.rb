class Article < ApplicationRecord
  attribute :markdown
  attribute :rendered

  has_many_media
  belongs_to :owner, polymorphic: true

  validate :referenced_medias

  def referenced_medias
    referenced_ids = markdown.scan(/\/midias\/(\d+)/).map &:first
    self.media_ids = referenced_ids.select do |media_id|
      break true if Media.exists? id: media_id, owner_id: [nil, id], owner_type: [nil, 'Article']
      byebug
      errors.add :medias, "ID #{id} não existe ou já está associado a outro objeto"
      return false
    end
  end
end