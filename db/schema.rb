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

ActiveRecord::Schema.define(version: 20170403203638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "behaviors", force: :cascade do |t|
    t.string "keyword"
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "teacher"
    t.string "room"
  end

  create_table "observations", force: :cascade do |t|
    t.date    "date"
    t.time    "time"
    t.integer "duration"
    t.string  "location"
    t.string  "logged_by"
    t.string  "comments"
    t.integer "student_id"
    t.integer "behavior_id"
    t.index ["behavior_id"], name: "index_observations_on_behavior_id", using: :btree
    t.index ["student_id"], name: "index_observations_on_student_id", using: :btree
  end

  create_table "student_target_behaviors", force: :cascade do |t|
    t.string  "student_specific_description"
    t.integer "student_id"
    t.integer "behavior_id"
    t.index ["behavior_id"], name: "index_student_target_behaviors_on_behavior_id", using: :btree
    t.index ["student_id"], name: "index_student_target_behaviors_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string  "name"
    t.integer "classroom_id"
    t.index ["classroom_id"], name: "index_students_on_classroom_id", using: :btree
  end

  add_foreign_key "observations", "behaviors"
  add_foreign_key "observations", "students"
  add_foreign_key "student_target_behaviors", "behaviors"
  add_foreign_key "student_target_behaviors", "students"
  add_foreign_key "students", "classrooms"
end
