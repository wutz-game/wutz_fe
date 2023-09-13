# Note: I named this PORO "quiz_category" because the word "category" is a reserved word in Rails.
class QuizCategory
  attr_reader :name,
              :emoji

  def initialize(params)
    @name  = params[:category]
    @emoji = params[:category_emoji]
  end
end