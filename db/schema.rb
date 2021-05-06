# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_06_014403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "line_analyses", force: :cascade do |t|
    t.string "name"
    t.string "line_type"
    t.string "objective"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description_md"
    t.index ["name"], name: "index_line_analyses_on_name", unique: true
  end

  create_table "reports", force: :cascade do |t|
    t.string "interviewee"
    t.integer "resides_since"
    t.text "full_text"
    t.string "address"
    t.float "addr_lat"
    t.float "addr_lon"
    t.date "interview_date"
    t.boolean "approved", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "full_text_md"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.boolean "admin", default: false, null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type"
    t.string "{:null=>false}"
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
