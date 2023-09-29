class GameSerializer
  include JSONAPI::Serializer

  def self.serialize(game_data)
    game = game_data.first.game

    categories = game.question_categories

    {
      data: {
        type: "game",
        id: game.id,
        date: game.orig_date,
        categories: serialize_categories(categories, game_data)
      }
    }
  end

  def self.serialize_categories(categories, game_data)
    categories.map do |category|
      {
        category: category.name,
        category_emoji: category.emoji, #ummm something about chatgippity here
        questions: serialize_questions(category, game_data)
      }
    end
  end

  def self.serialize_questions(category, game_data)
    game_questions = game_data.select { |game_question| game_question.question.category_id == category.jservice_id }

    game_questions.map do |game_question|
      question = game_question.question
      {
        answer: question.answer,
        question: question.clue,
        game_question_id: game_question.id,
        points: question.value
      }
    end
  end
end