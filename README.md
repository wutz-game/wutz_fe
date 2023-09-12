<<<<<<< HEAD
# Wutz

_What's Wutz?_

Wutz is a daily social trivia game featuring clues from the Jeopardy! game show. [^1] This Repo is the Wutz backend API that builds games from questions and stores completed user games.

## Table of Contents

- [🔗 Important Links](#🔗-important-links)
- [🔌 Wutz API Endpoints](#🔌-wutz-api-endpoints)
- [🚀 Getting Started](#-getting-started)
- [🌐 APIs Consumed](#-apis-consumed)
- [💾 Database Structure](#💾-database-structure)
- [👤 Authors](#-authors)

## 🔗 Important Links

### Front End

[Depolyed Game: Play Wutz!](https://hidden-spire-29708-f563a2b7cacc.herokuapp.com/)

[Github](https://github.com/wutz-game/wutz_fe)

### Back End

[Deployed API](https://pacific-wildwood-99462-95c6d81ab3e1.herokuapp.com/api/challenges)

[GitHub Repo](https://github.com/wutz-game/wutz_be)

## 🔌 Wutz API Endpoints

### Request Endpoint

`GET` `/api/challenges`

#### Response

<details closed>
<summary>Successful Response Body</summary>

```json
{
  "data": {
    "type": "game",
    "id": 1,
    "date": "18/09/2023",
    "categories": [
      {
        "category": "first ladies",
        "category_emoji": null,
        "questions": [
          {
            "answer": "Abigail Adams",
            "question": "Born in Massachusetts, she was descended from the Quincy family on her mother's side",
            "points": 1
          },
          {
            "answer": "Mary Lincoln",
            "question": "While she was First Lady, her half brother Samuel was killed at the Battle of Shiloh",
            "points": 2
          },
          {
            "answer": "Grace Coolidge",
            "question": "She graduated from the University of Vermont in 1902",
            "points": 3
          }
        ]
      },
      {
        "category": "geography",
        "category_emoji": null,
        "questions": [
          {
            "answer": "Kazakhstan",
            "question": "Of the 14 countries that border Russia, this \"stan\" country shares the longest border with it, 4,750 miles",
            "points": 1
          },
          {
            "answer": "Italy",
            "question": "The northern end of this country's largest lake, Lake Garda in the Po Valley, once belonged to Austria",
            "points": 2
          },
          {
            "answer": "a steppe",
            "question": "A vast grassland from central Europe to Manchuria is called by this 1-syllable word from the Russian",
            "points": 3
          }
        ]
      },
      {
        "category": "sports",
        "category_emoji": null,
        "questions": [
          {
            "answer": "golf",
            "question": "Ben Crenshaw & Phil Mickelson are the only 3-time winners of this college sport's championship tournament",
            "points": 1
          },
          {
            "answer": "Emmitt Smith",
            "question": "In 1994 this Dallas Cowboy scored 22 touchdowns; in 1995 he topped that with 25",
            "points": 2
          },
          {
            "answer": "Carlton Fisk",
            "question": "Inducted into the Hall of Fame in 2000, this catcher hit a dramatic homer in Game 6 of the 1975 World Series",
            "points": 3
          }
        ]
      }
    ]
  }
}
```

</details>

</details>

### Post Your Completed Daily Challenge

#### Request Endpoint

`POST` `/api/user_games`

#### Post Format

<details closed>
<summary>Example POST Request Format</summary>

```json
{
  "data": {
    "type": "user_games",
    "user_id": 12,
    "game_id": 1,
    "score": 6,
    "user_answers": [
      {
        "game_question_id": 1,
        "user_answer": "putting green eggs and ham",
        "result": "self_corrected"
      },
      {
        "game_question_id": 2,
        "user_answer": "the Hebrew National league",
        "result": "correct"
      },
      {
        "game_question_id": 3,
        "user_answer": "cheshire cat scan",
        "result": "self_corrected"
      },
      {
        "game_question_id": 4,
        "user_answer": "coors",
        "result": "correct"
      },
      {
        "game_question_id": 5,
        "user_answer": "",
        "result": "skipped"
      },
      {
        "game_question_id": 6,
        "user_answer": "jack daniels",
        "result": "incorrect"
      },
      {
        "game_question_id": 7,
        "user_answer": "a down town",
        "result": "self_corrected"
      },
      {
        "game_question_id": 8,
        "user_answer": "happy pappy",
        "result": "incorrect"
      },
      {
        "game_question_id": 9,
        "user_answer": "a low blow",
        "result": "self_corrected"
      }
    ]
  }
}
```

</details>

</details>

#### Response

<details closed>
<summary>Successful Response Body</summary>

```json
{
  "data"=>{
    "id"=>"8",
    "type"=>"user_game",
    "attributes"=>{
      "user_id"=>12,
      "score"=>6, "created_at"=>"2023-09-20T20:27:59.247Z"
      },
    "relationships"=>{
      "game"=>{
        "data"=>{
          "id"=>"16",
          "type"=>"game"}
      }
    }
  }
}
```

</details>

## 🚀 Getting Started

### Requirements

- Rails 7.0.X
- Ruby 3.2.x
- PostgresQL
- A ChatGPT API Key to generate Emojis

### Installing

<details closed>

<summary>Clone the repo to your local machine</summary>

```
You can also fork it if you would like to work on your own project
```

</details>

<details closed>

<summary>Install all requisite Gems:</summary>

```
bundle install
```

</details>

<details closed>

<summary>Create and seed your local Postgres database</summary>

```
rails db:{create,migrate,seed}
```

</details>

<details closed>

<summary>Run the Rake task to create the day's game</summary>

```
rails daily_game:create_new_daily_game
```

</details>

### Testing

API testing using the endpoints above can be done manually (cURLs) or through Postman (or other similar application.

<details closed>

<summary>Code testing is done with these gems and bundle exec rspec</summary>

```
  gem 'webmock'
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails'
  gem 'simplecov', require: false, group: :test
  gem 'vcr'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'pry'
```

</details>

## 🌐 APIs Consumed

- [jService.io](https://jservice.io/)
- [ChatGPT](https://platform.openai.com/docs/guides/gpt)

## 💾 Database Structure

### Visual Representation:

[Wutz BE Visual DB Structure](https://github.com/wutz-game/wutz_be/assets/8324716/f0ec16e2-997d-46a8-a4c9-40fe0539cd46)

### Schema:

<details closed>

<summary>Code</summary>

```
ActiveRecord::Schema[7.0].define(version: 2023_09_20_053617) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_foreign_key "game_questions", "games"
  add_foreign_key "game_questions", "questions"
  add_foreign_key "user_answers", "game_questions"
  add_foreign_key "user_answers", "user_games"
  add_foreign_key "user_games", "games"
end
```

</details>



## 👤 Authors

**Wutz** is a student project built in September, 2023 for the Backend Program of the [Turing School of Software and Design](https://turing.edu/).

- **Ethan Black** ❗([Github](https://github.com/ethanrossblack), [LinkedIn](https://www.linkedin.com/in/ethanrossblack/))
- **Chris Cullinane** ❗ ([Github](https://github.com/topher-nullset), [LinkedIn](https://www.linkedin.com/in/chris-cullinane-be/))
- **Ian Lyell** ❗ ([Github](https://github.com/ILyell), [LinkedIn](https://www.linkedin.com/in/ian-lyell/))
- **Connor Richmond** ❗ ([Github](https://github.com/ConnorRichmond), [LinkedIn](https://www.linkedin.com/in/corichmond/))
- **Mike Wood** ❗ ([Github](https://github.com/MWoodshop), [LinkedIn](https://www.linkedin.com/in/michaelwilliamwood/))

## Notice

All clues are pulled from [jService.io](https://jservice.io/).


[^1]: _The Jeopardy! game show and all elements thereof, including but not limited to copyright and trademark thereto, are the property of Jeopardy Productions, Inc. This application is not affiliated with, sponsored by, or operated by Jeopardy Productions, Inc._
=======
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
>>>>>>> 66136fd (Initial commit)
