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

ActiveRecord::Schema.define(version: 20150109014609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_enrollments", force: :cascade do |t|
    t.integer  "course_id",         null: false
    t.integer  "user_id",           null: false
    t.string   "role",              null: false
    t.integer  "lessons_completed"
    t.datetime "dropped_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "course_enrollments", ["course_id"], name: "index_course_enrollments_on_course_id", using: :btree
  add_index "course_enrollments", ["user_id"], name: "index_course_enrollments_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name",          null: false
    t.date     "starts_on"
    t.integer  "lessons_count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "courses", ["name"], name: "index_courses_on_name", unique: true, using: :btree

  create_table "lesson_enrollments", force: :cascade do |t|
    t.integer  "course_enrollment_id",             null: false
    t.integer  "lesson_id",                        null: false
    t.integer  "units_completed",      default: 0
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "lesson_enrollments", ["course_enrollment_id", "lesson_id"], name: "index_lesson_enrollments_on_course_enrollment_id_and_lesson_id", unique: true, using: :btree
  add_index "lesson_enrollments", ["course_enrollment_id"], name: "index_lesson_enrollments_on_course_enrollment_id", using: :btree
  add_index "lesson_enrollments", ["lesson_id"], name: "index_lesson_enrollments_on_lesson_id", using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "course_id",   null: false
    t.string   "name",        null: false
    t.integer  "number",      null: false
    t.text     "content"
    t.integer  "units_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lessons", ["course_id", "number"], name: "index_lessons_on_course_id_and_number", unique: true, using: :btree
  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.integer  "lesson_id",  null: false
    t.string   "name",       null: false
    t.integer  "number",     null: false
    t.string   "video_url"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "units", ["lesson_id", "number"], name: "index_units_on_lesson_id_and_number", unique: true, using: :btree
  add_index "units", ["lesson_id"], name: "index_units_on_lesson_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",              null: false
    t.string   "password_digest"
    t.boolean  "temporary_password"
    t.datetime "last_logged_in_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "course_enrollments", "courses"
  add_foreign_key "course_enrollments", "users"
  add_foreign_key "lesson_enrollments", "course_enrollments"
  add_foreign_key "lesson_enrollments", "lessons"
  add_foreign_key "lessons", "courses"
end
