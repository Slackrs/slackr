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

ActiveRecord::Schema.define(version: 20150623163141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.date    "date"
    t.integer "student_id"
    t.boolean "present"
    t.boolean "late"
    t.boolean "absent"
    t.boolean "excused"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string  "name",        null: false
    t.date    "start_date"
    t.date    "end_date"
    t.integer "producer_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cohort_id"
  end

  create_table "producers", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email"
    t.string   "phone_num"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cohort_id"
  end

end
