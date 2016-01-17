# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160116182820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.boolean  "male",               default: false
    t.text     "picture_file"
    t.boolean  "active_user"
    t.integer  "state_id"
    t.integer  "user_id"
    t.integer  "race_id"
    t.integer  "cencus_call_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.float    "longitude"
    t.float    "latitude"
    t.string   "city"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "birth_year"
  end

  create_table "person_data", force: :cascade do |t|
    t.text     "json_hash"
    t.integer  "state_pop"
    t.integer  "age_pop"
    t.integer  "gender_pop"
    t.integer  "gender_race_pop"
    t.integer  "gender_age_pop"
    t.integer  "gender_age_and_race_pop"
    t.integer  "person_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "vote_able"
    t.datetime "created"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "races", force: :cascade do |t|
    t.string   "name"
    t.string   "race_letter"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "state_birth_names", force: :cascade do |t|
    t.string   "sex"
    t.integer  "year"
    t.string   "name"
    t.integer  "frequency"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "state_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "land_area"
    t.string   "state_abbr"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
