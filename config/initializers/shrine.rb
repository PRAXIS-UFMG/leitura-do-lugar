require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploaded/cache"), # temporary
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploaded") # permanent
}

Shrine.plugin :activerecord
Shrine.plugin :upload_options, cache: { move: true }, store: { move: true }
