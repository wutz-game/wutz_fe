# Note: I named this PORO "quiz_category" because the word "category" is a reserved word in Rails.
class QuizCategory
  attr_reader :name,
              :emoji,
              :questions

  def initialize(params)
    @name      = params[:category]
    @emoji     = params[:category_emoji]
    @questions = QuestionsFactory.build(questions_array: params[:questions],
                                        quiz_category: name)
  end
end