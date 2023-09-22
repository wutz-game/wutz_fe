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
    include JSONAPI::Serializer
    
    def initialize(user,questions,score,categories, game_id)
        @user = user
        @questions = JSON.parse(questions)
        @score = score
        @categories = JSON.parse(categories)
        @game_id = game_id
    end
    def serialize
        {
            data: { 
                type: "user_games",
                user_id: @user,
                game_id: @game_id,
                score: @score,
                user_answers: serialize_questions(@questions)
            }
        }
    end

    def serialize_questions(questions)
        questions.map do |question|
            {
                "game_question_id": question[1]["question_id"],
                "user_answer": question[1]["userAnswer"],
                "result": serialized_result(question[1])
            }
        end
    end

    def serialized_result(question)
        if question["skipped"] == true
            "skipped"
        elsif question["override"] == true
            "self_corrected"
        elsif question["correct"] == true
            "correct"
        else 
            "incorrect"
        end
    end
end
