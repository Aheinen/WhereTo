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

ActiveRecord::Schema.define(version: 20150619180725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.binary   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_events", force: true do |t|
    t.integer  "category_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_events", ["category_id"], name: "index_category_events_on_category_id", using: :btree
  add_index "category_events", ["event_id"], name: "index_category_events_on_event_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.text     "description"
    t.string   "venue"
    t.string   "price"
    t.string   "image"
    t.boolean  "free"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "performer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", force: true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["category_id"], name: "index_interests_on_category_id", using: :btree
  add_index "interests", ["user_id"], name: "index_interests_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "city"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wishlists", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "accepted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wishlists", ["event_id"], name: "index_wishlists_on_event_id", using: :btree
  add_index "wishlists", ["user_id"], name: "index_wishlists_on_user_id", using: :btree

end
