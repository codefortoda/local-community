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

ActiveRecord::Schema.define(version: 2018_11_24_041225) do

  create_table "events", force: :cascade do |t|
    t.integer "group_id"
    t.string "name"
    t.string "url"
    t.string "place"
    t.string "kaisai_date"
    t.text "notices"
    t.text "announcement"
    t.string "price"
    t.string "organizer"
    t.text "how_apply"
    t.string "period"
    t.string "contact_name"
    t.string "ontact"
    t.string "location"
    t.string "access"
    t.string "parking_lot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_events_on_group_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.integer "identifier"
    t.integer "organization_code"
    t.string "organization_name"
    t.string "identifier_name"
    t.string "name"
    t.text "overview"
    t.string "common_name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "tel"
    t.string "url"
    t.float "barrier_free"
    t.integer "facility_category_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "start_time"
    t.string "end_time"
    t.text "use"
    t.text "service"
    t.text "fixture"
    t.boolean "renting_space", default: false, null: false
    t.boolean "conference", default: false, null: false
    t.boolean "performance", default: false, null: false
    t.boolean "sports", default: false, null: false
    t.boolean "classroom", default: false, null: false
    t.boolean "flyer", default: false, null: false
    t.index ["facility_category_id"], name: "index_facilities_on_facility_category_id"
  end

  create_table "facility_categories", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "sys_flag", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.string "image", null: false
    t.string "facebook_url"
    t.string "url"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "detail"
    t.integer "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_spaces_on_facility_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
