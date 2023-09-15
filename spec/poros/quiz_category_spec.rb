require "rails_helper"

RSpec.describe "Quiz Category PORO" do
  before do
    @params = {
      :category=>"before & after",
      :category_emoji=>"🕰️",
      :questions=> [
        {:answer=>"a putting Green Eggs and Ham", :question=>"Golf short game practice area served up in the title of a Dr. Seuss book", :points=>1},
        {:answer=>"the Hebrew National League", :question=>"If they used a well-known brand of kosher hot dogs instead of bats, the Dodgers & Phillies would be in this baseball group", :points=>2},
        {:answer=>"the Cheshire Cat scan", :question=>"Grinning enigmatic acquaintance of Alice in Wonderland seen in cross section by doctors", :points=>3}
      ]
    }

    @quiz_category = QuizCategory.new(@params)
  end

  it "exists and has attributes" do
    expect(@quiz_category.name).to eq(@params[:category])
    expect(@quiz_category.name).to be_a(String)

    expect(@quiz_category.emoji).to eq(@params[:category_emoji])
    expect(@quiz_category.emoji).to be_a(String)
  end

  it "has an array of Question objects" do
    expect(@quiz_category.questions).to be_an(Array)
    expect(@quiz_category.questions.length).to eq(3)
    expect(@quiz_category.questions[0]).to be_a(Question)
  end
end