# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#Creates Questions in the database based on a category ID and a point value

GameQuestion.delete_all
UserAnswer.delete_all
Question.delete_all
UserGame.delete_all
Game.delete_all

def question_create(cat)
    response = JApiService.new.clues_by_category(cat)
    response.each do |q|
        formated_question = QuestionSerializer.format_question(q)
        Question.create(formated_question)
    end
end

# Array for allowed categories by ID
categories = [67,51,81]

# Create questions for each category, at 3 difficulty levels
categories.each do |cat|
    question_create(cat)
end
User.create(username: "username_test", email: "email_test", password: "password_test")
