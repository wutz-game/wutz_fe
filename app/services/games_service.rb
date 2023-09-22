class GamesService

  # Note: This is mocked data, at the moment. This will update when we have an endpoint for the BE. This is the expected return value of a game.
  def conn
    Faraday.new("https://pacific-wildwood-99462-95c6d81ab3e1.herokuapp.com")
  end

  def get_url(url)        
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def post_game(game)
    response = Faraday.post do |req| 
      req.url "https://pacific-wildwood-99462-95c6d81ab3e1.herokuapp.com/api/user_games"
      req.headers[:content_type] = 'application/json'
      req.body = JSON.generate(user_game: game)
    end
    binding.pry
  end

  def get_daily_game
    get_url("/api/challenges")
  end
end