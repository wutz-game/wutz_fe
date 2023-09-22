require "rails_helper"

RSpec.describe "Games Facade" do
  before do
    @games_facade = GamesFacade.new
  end

  describe "instance methods", :vcr do
    describe "#games_service" do
      it "creates a new GamesService object" do
        expect(@games_facade.games_service).to be_a GamesService
      end
    end

    describe "#game_data", :vcr do
      it "gets game data" do
        expect(@games_facade.game_data).to be_a Hash
        # Note: look to the spec/services/games_service_spec file for thorough testing of what game_data should look like
      end
    end

    describe "categories", :vcr do
      it "returns an array of the three QuizCategory objects" do
        expect(@games_facade.categories).to be_an Array
        expect(@games_facade.categories.first).to be_a QuizCategory
      end
    end

    describe "questions", :vcr do
      it "returns a hash all nine Question objects" do
        # For the purposes of this visualization, "cat" is short for "Category"
        # Cat1 | Cat2 | Cat 3
        #  Q1  |  Q2  |  Q3
        #  Q4  |  Q5  |  Q6
        #  Q7  |  Q8  |  Q9

        expect(@games_facade.questions).to be_an Array
        expect(@games_facade.questions.length).to eq(3)
        
        first_row = @games_facade.questions.first

        expect(first_row).to be_an Array
        expect(first_row.length).to eq(3)

        expect(first_row[0]).to be_a Question
        expect(first_row[1]).to be_a Question
        expect(first_row[2]).to be_a Question
      end
    end
  end
end