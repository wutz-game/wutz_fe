class GameResultsController < ApplicationController
  def index 
    @facade = ResultsFacade.new(cookies[:answeredQuestions], cookies[:gameScore])
  end
end
