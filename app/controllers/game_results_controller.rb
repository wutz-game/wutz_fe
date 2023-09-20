class GameResultsController < ApplicationController
  def index 
    @facade = ResultsFacade.new(cookies[:answeredQuestions])
  end
end
