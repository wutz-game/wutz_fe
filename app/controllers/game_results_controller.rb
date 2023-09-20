class GameResultsController < ApplicationController
  def index
    @facade = ResultsFacade.new
  end
end
