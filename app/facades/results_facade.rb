class ResultsFacade
  attr_reader :score

  def initialize(results, score, categories)
      @score = score
      @questions = JSON.parse(results, symbolize_names: true)
      @categories = JSON.parse(categories, symbolize_names: true)
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
      "#{@categories[:cat_0][:emoji]}#{@categories[:cat_1][:emoji]}#{@categories[:cat_2][:emoji]}"
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
      elsif question[1][:correct] == true
        "🟩"
      elsif question[1][:correct] == false
        "🟥"
      end
  end

  def cell_lookup(cell)
    @questions.each do |q|
          return q if q[0] == cell
      end
  end
end