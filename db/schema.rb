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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2018_04_24_054124) do
=======
ActiveRecord::Schema.define(version: 2018_04_25_021208) do
>>>>>>> master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "unique_code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show"
  end

<<<<<<< HEAD
  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "valid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

=======
  create_table "events_users", id: false, force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.string "user_role"
    t.index ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id"
    t.index ["user_id", "event_id"], name: "index_events_users_on_user_id_and_event_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "creator"
    t.bigint "event_id"
    t.boolean "show"
    t.index ["event_id"], name: "index_groups_on_event_id"
  end

  create_table "groups_interests", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "interest_id", null: false
    t.index ["group_id", "interest_id"], name: "index_groups_interests_on_group_id_and_interest_id"
    t.index ["interest_id", "group_id"], name: "index_groups_interests_on_interest_id_and_group_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.index ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id"
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "title"
  end

  create_table "interests_users", id: false, force: :cascade do |t|
    t.bigint "interest_id", null: false
    t.bigint "user_id", null: false
    t.index ["interest_id", "user_id"], name: "index_interests_users_on_interest_id_and_user_id"
    t.index ["user_id", "interest_id"], name: "index_interests_users_on_user_id_and_interest_id"
  end

  add_foreign_key "groups", "events"
>>>>>>> master
end
