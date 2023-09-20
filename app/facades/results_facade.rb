class ResultsFacade

    def initialize(results)
        @user = results[:user_id]
        @score = results[:score]
        @questions = results[:user_answers]
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
        @questions.each do |q|
            return q if q[:game_question_id] == cell
        end
    end
end