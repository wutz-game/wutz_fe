require "rails_helper"

RSpec.describe "Quiz Category PORO" do
  it "exists and has attributes" do
    params = {category: "before & after", category_emoji: "🕰️" }

    quiz_category = QuizCategory.new(params)

    expect(quiz_category.name).to eq("before & after")
    expect(quiz_category.emoji).to eq("🕰️")
  end
end