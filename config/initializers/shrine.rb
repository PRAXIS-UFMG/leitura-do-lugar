require "shrine"
require "shrine/storage/file_system"

STORAGE_FOLDER = ENV.fetch "STORAGE_FOLDER", "storage"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new(STORAGE_FOLDER, prefix: "cache"), # temporary
  store: Shrine::Storage::FileSystem.new(STORAGE_FOLDER, prefix: "uploaded") # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :upload_options, cache: {move: true}, store: {move: true}
