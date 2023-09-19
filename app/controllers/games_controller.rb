class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:submit_result]  # Add this line

  def index
    @facade = GamesFacade.new
  end

  def submit_result
    game_result = params[:data]
    score = game_result['score']
    user_answers = game_result['user_answers']

    render json: { success: true }
  end
end
