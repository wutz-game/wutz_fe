class GamesFacade

  # eventually, initialize the facade with a user
  def initialize

  end

  def categories
    game_data[:data][:categories].map do |category_data|
      QuizCategory.new(category_data)
    end
  end

  def game_data
    @_game_data = games_service.get_todays_game
  end

  def games_service
    @_games_service ||= GamesService.new
  end

end