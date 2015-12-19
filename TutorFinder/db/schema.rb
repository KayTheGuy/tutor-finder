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

ActiveRecord::Schema.define(version: 20151208004840) do

  create_table "comments", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "post_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "connections", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "contact_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_tutors", force: :cascade do |t|
    t.integer  "user_id",                               null: false
    t.integer  "course_id",                             null: false
    t.string   "description", limit: 250
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.decimal  "rate",                    default: 0.0
  end

  create_table "courses", force: :cascade do |t|
    t.string   "department",    limit: 100, null: false
    t.string   "course_number", limit: 100, null: false
    t.string   "course_name",   limit: 100, null: false
    t.string   "description",   limit: 250, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",              null: false
    t.text     "body",               null: false
    t.integer  "user_id",            null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

# Could not dump table "requests" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "tutor_id",   null: false
    t.integer  "course_id",  null: false
    t.integer  "rate",       null: false
    t.string   "comment",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",         limit: 100,                 null: false
    t.string   "last_name",          limit: 100,                 null: false
    t.string   "email",              limit: 100,                 null: false
    t.string   "tel_number",         limit: 100, default: ""
    t.string   "password_digest",                                null: false
    t.integer  "role",                                           null: false
    t.boolean  "is_admin",                       default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
