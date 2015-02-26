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

ActiveRecord::Schema.define(version: 20150226022906) do

  create_table "applications", force: :cascade do |t|
    t.integer  "position_id"
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "applications", ["position_id"], name: "index_applications_on_position_id"
  add_index "applications", ["user_id"], name: "index_applications_on_user_id"

  create_table "applications_positions", id: false, force: :cascade do |t|
    t.integer "position_id"
    t.integer "application_id"
  end

  add_index "applications_positions", ["application_id", "position_id"], name: "index_applications_positions_on_application_id_and_position_id", unique: true

  create_table "images", force: :cascade do |t|
    t.string   "path"
    t.boolean  "profile_picture"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "images", ["resource_type", "resource_id"], name: "index_images_on_resource_type_and_resource_id"

  create_table "positions", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "profile_url"
    t.boolean  "is_admin"
    t.string   "confirmation_token"
    t.date     "confirmed_at"
    t.date     "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
