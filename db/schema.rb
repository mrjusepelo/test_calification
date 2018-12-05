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

ActiveRecord::Schema.define(version: 2018_12_05_211332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asignature_courses", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "asignature_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignature_id"], name: "index_asignature_courses_on_asignature_id"
    t.index ["course_id"], name: "index_asignature_courses_on_course_id"
  end

  create_table "asignature_students", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "asignature_id"
    t.float "value", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asignature_id"], name: "index_asignature_students_on_asignature_id"
    t.index ["student_id"], name: "index_asignature_students_on_student_id"
  end

  create_table "asignatures", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.index ["teacher_id"], name: "index_asignatures_on_teacher_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.bigint "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "asignature_courses", "asignatures"
  add_foreign_key "asignature_courses", "courses"
  add_foreign_key "asignature_students", "asignatures"
  add_foreign_key "asignature_students", "students"
  add_foreign_key "asignatures", "teachers"
  add_foreign_key "courses", "teachers"
  add_foreign_key "student_courses", "courses"
  add_foreign_key "student_courses", "students"
end