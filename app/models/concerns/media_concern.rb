module MediaConcern
  extend ActiveSupport::Concern

  class_methods do
    def has_many_media
      class_eval do
        has_many :medias, as: :owner, dependent: :destroy, autosave: true
        accepts_nested_attributes_for :medias, reject_if: :all_blank, allow_destroy: true

        def media_files
          medias.map(&:file)
        end
      end
    end
  end
end
