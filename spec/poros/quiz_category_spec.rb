require "rails_helper"

RSpec.describe "Quiz Category PORO" do
  before do
    @params = { category: "before & after", category_emoji: "🕰️" }

    @quiz_category = QuizCategory.new(@params)
  end

  it "exists and has attributes" do
    expect(@quiz_category.name).to eq(@params[:category])
    expect(@quiz_category.name).to be_a(String)

    expect(@quiz_category.emoji).to eq(@params[:category_emoji])
    expect(@quiz_category.emoji).to be_a(String)
  end
end