class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:submit_result]

  def index
    @facade = GamesFacade.new
  end

  def submit_result
    game_result = game_result_params

    if game_result.nil?
      render json: { success: false, error: 'No game_result in params' }, status: 400
      return
    end

    score = game_result[:score]
    user_answers = game_result[:user_answers]

    if score.nil? || user_answers.nil?
      render json: { success: false, error: 'Missing score or user_answers' }, status: 400
      return
    end

    # ... add actual logic for handling the game result ...

    render json: { success: true }
  end

  def clear_state
    # Clear session, cookies, or database state here
    session.clear

    render json: { success: true, message: 'Server-side game state cleared' }
  end

  private

  def game_result_params
    params.require(:data).require(:data).permit(
      :type, :user_id, :game_id, :score,
      user_answers: %i[game_question_id user_answer result]
    )
  end
end
