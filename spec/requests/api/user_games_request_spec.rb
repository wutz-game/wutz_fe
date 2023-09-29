# require "rails_helper"

# describe "User Games Endpoint ('/api/user_games')" do
#   describe "Create a new User Game (POST '/api/user_games')" do
#     it "can create a new daily UserGame" do
#       game = create(:game)
#       game_questions = create_list(:game_question, 9, game: game)

#       # Note: This is what should be sent by the Front End
#       user_game_params = 
#       { 
#         "data": { 
#           "type": "user_games",
#           "user_id": 12,
#           "game_id": game.id,
#           "score": 6,
#           "user_answers": [
#             {
#               "game_question_id": game_questions[0].id,
#               "user_answer": "putting green eggs and ham",
#               "result": "self_corrected"
#             },
#             {
#               "game_question_id": game_questions[1].id,
#               "user_answer": "the Hebrew National league",
#               "result": "correct"
#             },
#             {
#               "game_question_id": game_questions[2].id,
#               "user_answer": "cheshire cat scan",
#               "result": "self_corrected"
#             },
#             {
#               "game_question_id": game_questions[3].id,
#               "user_answer": "coors",
#               "result": "correct"
#             },
#             {
#               "game_question_id": game_questions[4].id,
#               "user_answer": "",
#               "result": "skipped"
#             },
#             {
#               "game_question_id": game_questions[5].id,
#               "user_answer": "jack daniels",
#               "result": "incorrect"
#             },
#             {
#               "game_question_id": game_questions[6].id,
#               "user_answer": "a down town",
#               "result": "self_corrected"
#             },
#             {
#               "game_question_id": game_questions[7].id,
#               "user_answer": "happy pappy",
#               "result": "incorrect"
#             },
#             {
#               "game_question_id": game_questions[8].id,
#               "user_answer": "a low blow",
#               "result": "self_corrected"
#             }
#           ]
#         }
#       }
#       headers = {"CONTENT_TYPE": "application/json"}

#       post "/api/user_games", headers: headers, params: JSON.generate(user_game: user_game_params)

#       # Verify that the endpoint returned a successful creation response
#       expect(response).to be_successful
#       expect(response.status).to eq(201)

#       # Verify that the endpoint actually created a new UserGame
#       user_game = UserGame.last
#       expect(user_game.game_id).to eq(user_game_params[:data][:game_id])
#       expect(user_game.user_id).to eq(user_game_params[:data][:user_id])
#       expect(user_game.score).to eq(user_game_params[:data][:score])

#       # Verify that the endpoint created 9 UserAnswers objects
#       user_answers = user_game.user_answers
#       expect(user_answers.length).to eq(9)
      
#       user_answer = user_answers.first
#       expect(user_answer).to be_a(UserAnswer)
#       expect(user_answer.user_game_id).to eq(user_game.id)
#       expect(user_answer.game_question_id).to eq(user_game_params[:data][:user_answers][0][:game_question_id])
#       expect(user_answer.user_answer).to eq(user_game_params[:data][:user_answers][0][:user_answer])
#       expect(user_answer.result).to eq(user_game_params[:data][:user_answers][0][:result])
#     end
#   end
# end