class Question
  attr_reader :question,
              :answer,
              :points,
              :status,
              :quiz_category,
              :user_answer
              
  def initialize(params, quiz_category)
    @question      = params[:question]
    @answer        = params[:answer]
    @points        = params[:points]
    @quiz_category = quiz_category
    @user_answer   = nil
    @status        = 0 
    # Status should be an enum on whether a question is unanswered, skipped, incorrect, correct, or marked correct
    # { 0: unanswered, 
    #   1: skipped, 
    #   2: incorrect,
    #   3: correct outright,
    #   4: marked as correct }
  end
end