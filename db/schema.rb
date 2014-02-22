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

ActiveRecord::Schema.define(version: 20140222074748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "year"
    t.string   "major"
    t.string   "gpa"
    t.string   "cs_gpa"
    t.text     "why_join"
    t.text     "work_sample"
    t.string   "development_type"
    t.text     "coursework"
    t.text     "commitments"
    t.text     "rails_exp"
    t.text     "mobile_exp"
    t.string   "cc_availability"
    t.string   "retreat_availability"
    t.string   "meeting_availability"
    t.string   "dinner_availability"
    t.string   "commitment_availability"
    t.string   "referral"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "front_end"
    t.string   "back_end"
    t.string   "graphic_design"
    t.integer  "semester_id"
    t.boolean  "hidden",                  default: false
  end

  create_table "evaluations", force: true do |t|
    t.integer  "user_id"
    t.integer  "application_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "decision"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "creator"
    t.string   "location"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hackathon_submissions", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "hackathon_id"
    t.string   "demo"
    t.string   "github"
    t.string   "video_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hackathons", force: true do |t|
    t.integer  "semester_id"
    t.string   "name"
    t.string   "registration_link"
    t.datetime "starts"
    t.datetime "ends"
    t.string   "location"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "partial"
    t.string   "url"
  end

  create_table "messages", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.string   "inquiry_type"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: true do |t|
    t.string   "name"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "positions", ["name"], name: "index_positions_on_name", using: :btree
  add_index "positions", ["user_type"], name: "index_positions_on_user_type", using: :btree

  create_table "project_photos", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "client"
    t.string   "title"
    t.text     "description"
    t.string   "link"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "semester_id"
    t.string   "app_type"
  end

  create_table "roles", force: true do |t|
    t.integer "user_id"
    t.integer "position_id"
    t.integer "semester_id"
    t.string  "name"
    t.string  "user_type"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree
  add_index "roles", ["semester_id"], name: "index_roles_on_semester_id", using: :btree
  add_index "roles", ["user_id", "semester_id"], name: "index_roles_on_user_id_and_semester_id", using: :btree
  add_index "roles", ["user_type", "semester_id"], name: "index_roles_on_user_type_and_semester_id", using: :btree
  add_index "roles", ["user_type"], name: "index_roles_on_user_type", using: :btree

  create_table "semesters", force: true do |t|
    t.string   "year"
    t.string   "semester"
    t.boolean  "current",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: true do |t|
    t.string   "sponsorship_type"
    t.string   "sponsor_link"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_activated",           default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   default: "",    null: false
    t.string   "year"
    t.string   "major"
    t.string   "site"
    t.boolean  "is_visible",             default: false, null: false
    t.string   "facebook_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "company"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
