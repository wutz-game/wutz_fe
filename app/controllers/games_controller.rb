class GamesController < ApplicationController
  def index
    @facade = GamesFacade.new
  end
end
