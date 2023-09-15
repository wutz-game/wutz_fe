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
    # {
    #   q1: categories[0].questions[0],
    #   q2: categories[1].questions[0],
    #   q3: categories[2].questions[0],
    #   q4: categories[0].questions[1],
    #   q5: categories[1].questions[1],
    #   q6: categories[2].questions[1],
    #   q7: categories[0].questions[2],
    #   q8: categories[1].questions[2],
    #   q9: categories[2].questions[2]
    # }
  end

  def categories
    @categories = game_data[:data][:categories].map do |category_data|
      QuizCategory.new(category_data)
    end
  end

  def game_data
    @game_data = GamesService.get_todays_game
  end

  def games_service
    @_games_service ||= GamesService.new
  end

end