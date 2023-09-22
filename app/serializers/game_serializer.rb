class GameSerializer
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