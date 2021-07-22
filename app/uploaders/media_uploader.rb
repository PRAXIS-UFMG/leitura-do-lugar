class MediaUploader < Shrine
  plugin :download_endpoint, prefix: "medias"
  plugin :cached_attachment_data

  class MediaUploader::Attacher < Shrine::Attacher
    def activerecord_after_save; end

    def promote_to_store
      promote
      persist
    end
  end

  class MediaUploader::UploadedFile < Shrine::UploadedFile
    def representable?
      image?
    end

    def image?
      metadata["mime_type"].start_with?("image/")
    end
  end
end