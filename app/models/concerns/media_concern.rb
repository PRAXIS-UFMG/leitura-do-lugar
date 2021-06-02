module MediaConcern
  extend ActiveSupport::Concern

  class_methods do
    def has_one_media
      class_eval do
        has_one :media, as: :owner, dependent: :destroy, autosave: true
        accepts_nested_attributes_for :media
        delegate :file, to: :media, prefix: true
      end
    end

    def has_many_media
      class_eval do
        has_many :medias, as: :owner, dependent: :destroy, autosave: true
        accepts_nested_attributes_for :medias

        def media_files
          medias.map(&:file)
        end
      end
    end
  end
end
