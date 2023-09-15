require "rails_helper"

RSpec.describe "Question PORO" do
  it "exists and has attributes" do
    params = {
      :answer=>"a putting Green Eggs and Ham", 
      :question=>"Golf short game practice area served up in the title of a Dr. Seuss book", 
      :points=>1
    }
    quiz_category = "before & after"

    question = Question.new(params, quiz_category)

    expect(question.question).to eq(params[:question])
    expect(question.answer).to eq(params[:answer])
    expect(question.points).to eq(params[:points])
    expect(question.quiz_category).to eq(quiz_category)
    
    # .status is 0 by default, meaning that the question is unanswered
    expect(question.status).to eq(0)
    
    # .user_answer is nil by default, meaning that the user hasn't answered the question yet
    expect(question.user_answer).to eq(nil)
  end
end