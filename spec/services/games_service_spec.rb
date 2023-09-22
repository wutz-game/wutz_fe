require "rails_helper"

describe GamesService do
  describe "class methods" do
    describe ".get_todays_game" do
      it "returns parsed data for the day's game", :vcr do
        todays_game = GamesService.new.get_daily_game
        
        expect(todays_game).to be_a Hash
        expect(todays_game).to have_key :data
        
        # Game Data Keys/Classes
        game_data = todays_game[:data]

        expect(game_data).to be_a Hash

        expect(game_data).to have_key :type
        expect(game_data[:type]).to eq("game")
        
        expect(game_data).to have_key :id
        expect(game_data[:id]).to be_an Integer
        
        expect(game_data).to have_key :date
        # WE'LL SEE WHAT HAPPENS WHEN THE REAL DATA IS PASSED OVER
        # expect(game_data[:date]).to be_a DateTime
        
        expect(game_data).to have_key :categories
        expect(game_data[:categories]).to be_an Array
        expect(game_data[:categories].length).to eq(3)
        
        # Category Data Keys/Classes
        category_data = game_data[:categories].first
        
        expect(category_data).to be_a Hash

        expect(category_data).to have_key :category
        expect(category_data[:category]).to be_a String
        
        expect(category_data).to have_key :category_emoji
        expect(category_data[:category_emoji]).to be_a String
        expect(category_data[:category_emoji].grapheme_clusters.length).to eq(1)
        # Note: if you call .length on an string emoji in Ruby, it can have different lengths because of the encoding. Calling '.grapheme_clusters' apparently just counts the amount of characters?
        # I figured it out from this website: https://tomdebruijn.com/posts/rust-string-length-width-calculations/
        # Ruby Docs on .grapheme_clusters: https://ruby-doc.org/core-3.1.2/String.html#grapheme_clusters-method
        
        expect(category_data).to have_key :questions
        expect(category_data[:questions]).to be_an Array
        expect(category_data[:questions].length).to eq(3)

        # Question Data Keys/Classes
        question_data = category_data[:questions].first

        expect(question_data).to be_a Hash

        expect(question_data).to have_key :answer
        expect(question_data[:answer]).to be_a String
        
        expect(question_data).to have_key :question
        expect(question_data[:question]).to be_a String

        expect(question_data).to have_key :points
        expect(question_data[:points]).to be_an Integer
      end
    end
  end
end