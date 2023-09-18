class GamesService

  # Note: This is mocked data, at the moment. This will update when we have an endpoint for the BE. This is the expected return value of a game.
  def conn
    Faraday.new("https://wutz-be.onrender.com")
  end

  def get_url(url)        
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_daily_game
    get_url("/api/challenges")
  end
end