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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2023_09_21_051359) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_question_categories", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "question_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_question_categories_on_game_id"
    t.index ["question_category_id"], name: "index_game_question_categories_on_question_category_id"
  end

  create_table "game_questions", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_questions_on_game_id"
    t.index ["question_id"], name: "index_game_questions_on_question_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "orig_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_categories", force: :cascade do |t|
    t.string "name"
    t.string "emoji", default: "❓"
    t.integer "jservice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "clue"
    t.string "answer"
    t.string "category"
    t.integer "clue_id"
    t.integer "value"
    t.integer "category_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "user_game_id", null: false
    t.string "user_answer"
    t.integer "result", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "game_question_id", null: false
    t.index ["game_question_id"], name: "index_user_answers_on_game_question_id"
    t.index ["user_game_id"], name: "index_user_answers_on_user_game_id"
  end

  create_table "user_games", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score"
    t.index ["game_id"], name: "index_user_games_on_game_id"
  end

  add_foreign_key "game_question_categories", "games"
  add_foreign_key "game_question_categories", "question_categories"
  add_foreign_key "game_questions", "games"
  add_foreign_key "game_questions", "questions"
  add_foreign_key "user_answers", "game_questions"
  add_foreign_key "user_answers", "user_games"
  add_foreign_key "user_games", "games"
=======
ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

>>>>>>> f55c641 (Chore: updates files automatically)
end
