require "shrine"
require "shrine/storage/file_system"
require "image_processing/mini_magick"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploaded/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploaded") # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :derivation_endpoint, secret_key: Rails.application.secret_key_base

class FileUploader < Shrine
  # plugins and uploading logic
  plugin :derivation_endpoint, prefix: "midias/v"

  derivation :thumbnail do |file, width, height|
    ImageProcessing::MiniMagick.source(file).resize_to_limit!(width.to_i, height.to_i)
  end

  class FileUploader::UploadedFile
    def representable?
      image?
    end

    def image?
      metadata["mime_type"].start_with?("image/")
    end
  end
end
