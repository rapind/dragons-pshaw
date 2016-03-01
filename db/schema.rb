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

ActiveRecord::Schema.define(version: 20160301183907) do

  create_table "questions", force: :cascade do |t|
    t.integer  "standard_id"
    t.string   "label",       null: false
    t.float    "difficulty",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["standard_id"], name: "index_questions_on_standard_id"

  create_table "quiz_questions", force: :cascade do |t|
    t.integer  "quiz_id",     null: false
    t.integer  "question_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "quiz_questions", ["question_id"], name: "index_quiz_questions_on_question_id"
  add_index "quiz_questions", ["quiz_id"], name: "index_quiz_questions_on_quiz_id"

  create_table "quizzes", force: :cascade do |t|
    t.string   "name",                null: false
    t.integer  "number_of_questions", null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "standards", force: :cascade do |t|
    t.integer  "strand_id"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "standards", ["strand_id"], name: "index_standards_on_strand_id"

  create_table "strands", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
