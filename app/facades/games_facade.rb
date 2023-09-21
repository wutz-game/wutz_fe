class GamesFacade

  def questions
    @questions = 
    [
      [ 
        categories[0].questions[0],
        categories[1].questions[0],
        categories[2].questions[0]
      ],[ 
        categories[0].questions[1],
        categories[1].questions[1],
        categories[2].questions[1]
      ],[ 
        categories[0].questions[2],
        categories[1].questions[2],
        categories[2].questions[2]
      ]
    ]
  end

  def categories
    @categories = game_data[:data][:categories].map do |category_data|
      QuizCategory.new(category_data)
    end
  end

  def game_data
    @game_data = games_service.get_daily_game
  end

  def games_service
    @_games_service ||= GamesService.new
  end

end