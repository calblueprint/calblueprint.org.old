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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130115064426) do

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "email"
    t.string   "phone"
    t.string   "year"
    t.string   "major"
    t.decimal  "gpa"
    t.decimal  "cs_gpa"
    t.text     "why_join"
    t.string   "development_type"
    t.boolean  "cc_availability"
  end

  create_table "members", :force => true do |t|
    t.string "name"
    t.string "email"
    t.string "position"
    t.string "year"
    t.string "major"
    t.string "projects"
    t.string "experience"
    t.string "expertise"
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "inquiry_type"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.string   "position"
    t.string   "year"
    t.string   "major"
    t.string   "project"
    t.text     "experience"
    t.text     "about"
    t.string   "image"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
