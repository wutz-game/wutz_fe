class ResultsFacade

    def initialize
        # @user = results[:data][:user_id]
        @questions = {
            "data": {
                "type": "user_games",
                "user_id": 12,
                "game_id": 1,
                "score": -5,
                "user_answers": [
                    {
                        "game_question_id": "cell_0_0",
                        "user_answer": "test",
                        "result": "incorrect"
                    },
                    {
                        "game_question_id": "cell_0_1",
                        "user_answer": "test",
                        "result": "incorrect"
                    },
                    {
                        "game_question_id": "cell_0_2",
                        "user_answer": "",
                        "result": "skipped"
                    },
                    {
                        "game_question_id": "cell_1_0",
                        "user_answer": "",
                        "result": "incorrect"
                    },
                    {
                        "game_question_id": "cell_1_1",
                        "user_answer": "",
                        "result": "correct"
                    },
                    {
                        "game_question_id": "cell_1_2",
                        "user_answer": "",
                        "result": "skipped"
                    },
                    {
                        "game_question_id": "cell_2_2",
                        "user_answer": "",
                        "result": "skipped"
                    },
                    {
                        "game_question_id": "cell_2_0",
                        "user_answer": "",
                        "result": "correct"
                    },
                    {
                        "game_question_id": "cell_2_1",
                        "user_answer": "low blow down",
                        "result": "correct"
                    }
                    ]
                }
            }
            @cell_0_0 = cell_lookup("cell_0_0")
            @cell_0_1 = cell_lookup("cell_0_1")
            @cell_0_2 = cell_lookup("cell_0_2")
            @cell_1_0 = cell_lookup("cell_1_0")
            @cell_1_1 = cell_lookup("cell_1_1")
            @cell_1_2 = cell_lookup("cell_1_2")
            @cell_2_0 = cell_lookup("cell_2_0")
            @cell_2_1 = cell_lookup("cell_2_1")
            @cell_2_2 = cell_lookup("cell_2_2")
    end

    def result_output
        puts "🐘🚢🚚"
        puts "#{question_convert(@cell_0_0)}#{question_convert(@cell_0_1)}#{question_convert(@cell_0_2)}"
        puts "#{question_convert(@cell_1_0)}#{question_convert(@cell_1_1)}#{question_convert(@cell_1_2)}"
        puts "#{question_convert(@cell_2_0)}#{question_convert(@cell_2_1)}#{question_convert(@cell_2_2)}"
    end

    def question_convert(question)
        if question[:result] == "correct"
            "🟩"
        elsif question[:result] == "skipped"
            "🟨"
        elsif question[:result] == "incorrect"
            "🟥"
        end
    end

    def cell_lookup(cell)
        @questions[:data][:user_answers].each do |q|
            return q if q[:game_question_id] == cell
        end
    end
end