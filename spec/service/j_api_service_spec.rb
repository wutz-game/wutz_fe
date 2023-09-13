require 'rails_helper'

RSpec.describe JApiService, type: :service do
    describe '#instance methods' do
        it 'get_clues(category, point_value)', :vcr do
            response = JApiService.new.get_clues("67", "100")
        
            clue = response[0]

            expect(clue[:value]).to eq(100)
            expect(clue[:category_id]).to eq(67)
            expect(clue).to have_key(:answer)
            expect(clue).to have_key(:question)
            expect(clue).to have_key(:airdate)
        end
    end
end