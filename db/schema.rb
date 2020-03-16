# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_16_110426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calendar_events", force: :cascade do |t|
    t.string "name"
    t.boolean "public"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competition_galleries", force: :cascade do |t|
    t.string "competition_id"
    t.integer "user_id"
    t.boolean "draft", default: true, null: false
    t.boolean "feature", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competitions", id: false, force: :cascade do |t|
    t.string "id", null: false
    t.string "name"
    t.string "city"
    t.date "start_date"
    t.date "end_date"
    t.string "country_iso2"
    t.string "website"
    t.string "delegates"
    t.string "organizers"
    t.index ["id"], name: "index_competitions_on_id", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "event_id"
    t.string "name"
    t.integer "rank"
    t.string "format"
  end

  create_table "hardwares", force: :cascade do |t|
    t.string "name", null: false
    t.string "hardware_type", null: false
    t.string "comment"
    t.string "state", null: false
    t.bigint "bag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bag_id"], name: "index_hardwares_on_bag_id"
  end

  create_table "major_comps", force: :cascade do |t|
    t.string "competition_id"
    t.string "role"
    t.string "name"
    t.text "alt_text"
    t.index ["role"], name: "index_major_comps_on_role", unique: true
  end

  create_table "owners", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.integer "user_id", null: false
    t.date "start", null: false
    t.date "end", null: false
    t.index ["item_type", "item_id"], name: "index_owners_on_item_type_and_item_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "wca_id"
    t.string "name"
    t.integer "s_333"
    t.integer "a_333"
    t.integer "s_222"
    t.integer "a_222"
    t.integer "s_444"
    t.integer "a_444"
    t.integer "s_555"
    t.integer "a_555"
    t.integer "s_666"
    t.integer "a_666"
    t.integer "s_777"
    t.integer "a_777"
    t.integer "s_333bf"
    t.integer "a_333bf"
    t.integer "s_333fm"
    t.integer "a_333fm"
    t.integer "s_333oh"
    t.integer "a_333oh"
    t.integer "s_clock"
    t.integer "a_clock"
    t.integer "s_minx"
    t.integer "a_minx"
    t.integer "s_pyram"
    t.integer "a_pyram"
    t.integer "s_skewb"
    t.integer "a_skewb"
    t.integer "s_sq1"
    t.integer "a_sq1"
    t.integer "s_444bf"
    t.integer "a_444bf"
    t.integer "s_555bf"
    t.integer "a_555bf"
    t.integer "s_333mbf"
    t.integer "gold"
    t.integer "silver"
    t.integer "bronze"
  end

  create_table "post_tags", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.string "tag_name", null: false
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_name", "post_id"], name: "index_post_tags_on_tag_name_and_post_id", unique: true
    t.index ["tag_name"], name: "index_post_tags_on_tag_name"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.text "body"
    t.string "slug", null: false
    t.boolean "feature", default: false, null: false
    t.bigint "user_id", null: false
    t.boolean "draft", default: true, null: false
    t.boolean "competition_page", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "posted_at"
    t.index ["slug"], name: "index_posts_on_slug"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "stripe_charge_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.string "color"
    t.string "fullname"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "wca_id"
    t.string "country_iso2"
    t.string "email"
    t.string "avatar_url"
    t.string "avatar_thumb_url"
    t.string "gender"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "delegate_status"
    t.boolean "admin", default: false
    t.boolean "communication", default: false
    t.boolean "spanish_delegate", default: false
    t.boolean "notify_subscription", default: true
    t.boolean "board", default: false
    t.boolean "software", default: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
