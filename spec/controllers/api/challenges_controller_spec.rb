require 'rails_helper'

RSpec.describe Api::ChallengesController, type: :controller do
  describe 'GET #index' do
    it 'returns the last 9 game questions as JSON' do

      # Create the game and question categories
      game = FactoryBot.create(:game)
      question_categories = FactoryBot.create_list(:question_category, 3)

      # Associate the question categories with the game
      question_categories.each do |category|
        FactoryBot.create(:game_question_category, game: game, question_category: category)
      end

      # Create the game questions with matching category_id
      game_questions = []
      question_categories.each do |category|
        question1 = Question.create!(answer: "hello", clue: "greeting", clue_id: rand(1..99), value: 1, category: category.name, category_id: category.jservice_id)
        question2 = Question.create!(answer: "hello", clue: "greeting", clue_id: rand(1..99), value: 2, category: category.name, category_id: category.jservice_id)
        question3 = Question.create!(answer: "hello", clue: "greeting", clue_id: rand(1..99), value: 3, category: category.name, category_id: category.jservice_id)
        game_questions << FactoryBot.create(:game_question, game: game, question: question1)
        game_questions << FactoryBot.create(:game_question, game: game, question: question2)
        game_questions << FactoryBot.create(:game_question, game: game, question: question3)
      end

      get :index

      expect(response).to have_http_status(:ok)
      parsed_response = JSON.parse(response.body)

      # Ensure there are 3 categories
      expect(parsed_response["data"]["categories"].count).to eq(3)

      # Ensure there are 9 questions in total
      total_questions = parsed_response["data"]["categories"].sum { |category| category["questions"].count }
      expect(total_questions).to eq(9)
      # Add more expectations based on our serialization format
    end
  end
end