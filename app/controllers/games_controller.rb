class GamesController < ApplicationController
  def index
    @facade = GamesFacade.new
  end

  def show
    @facade = ResultFacade.new  
  end
end
