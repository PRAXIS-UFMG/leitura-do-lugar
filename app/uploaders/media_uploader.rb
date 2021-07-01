class MediaUploader < Shrine
  # plugins and uploading logic
  plugin :derivation_endpoint, prefix: "midias/v"

  derivation :thumbnail do |file, width, height|
    ImageProcessing::MiniMagick.source(file).resize_to_limit!(width.to_i, height.to_i)
  end

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