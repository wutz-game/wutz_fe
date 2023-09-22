require "rails_helper"

RSpec.describe "Games Facade" do
    before(:each) do
        gameCategories = "{\"cat_0\":{\"name\":\"music's missing links\",\"emoji\":\"🔗\"},\"cat_1\":{\"name\":\"name the olympic sport\",\"emoji\":\"🏅\"},\"cat_2\":{\"name\":\"first name's the same\",\"emoji\":\"👯‍♀️\"}}"
        gameScore = "2"
        answeredQuestions = "{\"cell_0_0\":{\"question_id\":\"28\",\"userAnswer\":\"Pyrenees Mountains\",\"correctAnswer\":\"Italy\",\"points\":\"1\",\"override\":false,\"skipped\":false,\"correct\":false},\"cell_0_1\":{\"question_id\":\"31\",\"userAnswer\":null,\"correctAnswer\":\"Ruth\",\"points\":\"1\",\"override\":false,\"skipped\":true},\"cell_0_2\":{\"question_id\":\"34\",\"userAnswer\":\"Pyrenees Mountains\",\"correctAnswer\":\"Mexico\",\"points\":\"1\",\"override\":true,\"skipped\":false,\"correct\":false},\"cell_1_0\":{\"question_id\":\"29\",\"userAnswer\":null,\"correctAnswer\":\"Ireland\",\"points\":\"2\",\"override\":false,\"skipped\":true},\"cell_1_1\":{\"question_id\":\"32\",\"userAnswer\":\"Hello\",\"correctAnswer\":\"Judges\",\"points\":\"2\",\"override\":true,\"skipped\":false,\"correct\":false},\"cell_1_2\":{\"question_id\":\"35\",\"userAnswer\":null,\"correctAnswer\":\"Mexico\",\"points\":\"2\",\"override\":false,\"skipped\":true},\"cell_2_0\":{\"question_id\":\"30\",\"userAnswer\":\"the Congo\",\"correctAnswer\":\"United States\",\"points\":\"3\",\"override\":false,\"skipped\":false,\"correct\":false},\"cell_2_1\":{\"question_id\":\"33\",\"userAnswer\":\"Pyrenees Mountains\",\"correctAnswer\":\"Genesis\",\"points\":\"3\",\"override\":true,\"skipped\":false,\"correct\":false},\"cell_2_2\":{\"question_id\":\"36\",\"userAnswer\":null,\"correctAnswer\":\"Afghanistan\",\"points\":\"3\",\"override\":false,\"skipped\":true}}"
        @results_facade = ResultsFacade.new(answeredQuestions, gameScore, gameCategories)
    end
    describe 'instance methods' do
        it 'creates emojis in a line for results page', :vcr do
            expect(@results_facade.categories).to eq("🔗🏅👯‍♀️")
        end
        it 'gets the first row of results', :vcr do 
            expect(@results_facade.results_1).to eq("🟥🟨🟩")
        end
        it 'gets the second row of results', :vcr do 
            expect(@results_facade.results_2).to eq("🟨🟩🟨")
        end
        it 'gets the third row of results', :vcr do 
            expect(@results_facade.results_3).to eq("🟥🟩🟨")
        end

        it 'converts a question to an emoji', :vcr do
            cell_2_0 = [:cell_2_0,{:correct=>true,:correctAnswer=>"Italy",:override=>false,:points=>"1", :question_id=>"28",:skipped=>false,:userAnswer=>"Pyrenees Mountains"}]
            cell_2_1 = [:cell_2_0,{:correct=>false,:correctAnswer=>"Italy",:override=>true,:points=>"1", :question_id=>"28",:skipped=>false,:userAnswer=>"Pyrenees Mountains"}]
            cell_2_2 = [:cell_2_0,{:correct=>false,:correctAnswer=>"Italy",:override=>false,:points=>"1", :question_id=>"28",:skipped=>true,:userAnswer=>"Pyrenees Mountains"}]
            cell_2_3 = [:cell_2_0,{:correct=>false,:correctAnswer=>"Italy",:override=>false,:points=>"1", :question_id=>"28",:skipped=>false,:userAnswer=>"Pyrenees Mountains"}]
            expect(@results_facade.question_convert(cell_2_0)).to eq("🟩")
            expect(@results_facade.question_convert(cell_2_1)).to eq("🟩")
            expect(@results_facade.question_convert(cell_2_2)).to eq("🟨")
            expect(@results_facade.question_convert(cell_2_3)).to eq("🟥")
        end

        it 'converts the question to the correct format', :vcr do
            expect(@results_facade.cell_lookup(:cell_0_0)).to eq([:cell_0_0,{:correct=>false,:correctAnswer=>"Italy",:override=>false,:points=>"1", :question_id=>"28",:skipped=>false,:userAnswer=>"Pyrenees Mountains"}])
        end
    end
end