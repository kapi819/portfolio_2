# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_13_020552) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "question_id", null: false
    t.bigint "choice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_answers_on_choice_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.text "question_body", null: false
    t.integer "question_type", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "cold_symptoms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "symptom_type", null: false
    t.string "symptom_title", null: false
    t.text "symptom_body", null: false
    t.string "solution", null: false
    t.string "image_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cold_symptoms_on_user_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "body_temperature"
    t.float "weight"
    t.float "body_fat"
    t.integer "physical_condition"
    t.integer "mental_condition"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "cold_symptom_id"
    t.text "goal_body", null: false
    t.integer "count", default: 0, null: false
    t.datetime "last_recorded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cold_symptom_id"], name: "index_goals_on_cold_symptom_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question_title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "choices"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "choices", "questions"
  add_foreign_key "cold_symptoms", "users"
  add_foreign_key "diaries", "users"
  add_foreign_key "goals", "cold_symptoms"
  add_foreign_key "goals", "users"
end
