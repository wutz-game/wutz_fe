class GameResultsController < ApplicationController
  def index 
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
    end
    @facade = ResultsFacade.new(cookies[:answeredQuestions], cookies[:gameScore], cookies[:gameCategories])
  end

  def submit
    @facade = GamesFacade.new
    service = GamesService.new
    serializer = GameSerializer.new(session[:user_id], cookies[:answeredQuestions], cookies[:gameScore], cookies[:gameCategories], @facade.game_data[:data][:id])
    service.post_game(serializer.serialize)
    redirect_to root_path
  end
end
