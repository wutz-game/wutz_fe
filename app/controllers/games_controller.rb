class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:submit_result]

  def index
    @facade = GamesFacade.new
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
    end
  end

  def submit_result
    game_result = game_result_params

    if game_result.nil?
      render json: { success: false, error: 'No game_result in params' }, status: 400
      return
    end

    user_answers = game_result[:user_answers]

    if user_answers.nil?
      render json: { success: false, error: 'Missing user_answers' }, status: 400
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
    if params[:data].present?
      params.require(:data).permit(user_answers: %i[game_question_id user_answer result])
    elsif params[:game] && params[:game][:data]
      params.require(:game).require(:data).permit(user_answers: %i[game_question_id user_answer result])
    end
  rescue ActionController::ParameterMissing
    nil
  end
end
