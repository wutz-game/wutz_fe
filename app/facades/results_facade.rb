class ResultsFacade
  attr_reader :score

  def initialize(results)
      @score = "-5"
      @questions = JSON.parse(results, symbolize_names: true)

      @cell_0_0 = cell_lookup(:cell_0_0)
      @cell_0_1 = cell_lookup(:cell_0_1)
      @cell_0_2 = cell_lookup(:cell_0_2)
      @cell_1_0 = cell_lookup(:cell_1_0)
      @cell_1_1 = cell_lookup(:cell_1_1)
      @cell_1_2 = cell_lookup(:cell_1_2)
      @cell_2_0 = cell_lookup(:cell_2_0)
      @cell_2_1 = cell_lookup(:cell_2_1)
      @cell_2_2 = cell_lookup(:cell_2_2)
  end

  def categories
      "🐘🚢🚚"
  end

  def results_1
      "#{question_convert(@cell_0_0)}#{question_convert(@cell_0_1)}#{question_convert(@cell_0_2)}"
  end
  
  def results_2
      "#{question_convert(@cell_1_0)}#{question_convert(@cell_1_1)}#{question_convert(@cell_1_2)}"
  end

  def results_3
      "#{question_convert(@cell_2_0)}#{question_convert(@cell_2_1)}#{question_convert(@cell_2_2)}"
  end

  def question_convert(question)
      if question[1][:override] == true
        "🟩"
      elsif question[1][:skipped] == true
        "🟨"
      elsif question_check(question) == true
        "🟩"
      elsif question_check(question) == false
        "🟥"
      end
  end

  def cell_lookup(cell)
    @questions.each do |q|
          return q if q[0] == cell
      end
  end

  def question_check(question)
    formated_q = question[1][:correctAnswer].downcase
    formated_a = question[1][:userAnswer].downcase if question[1][:userAnswer] != nil
    if formated_q.include?(formated_a) 
      true
    else
      false
    end
  end
end