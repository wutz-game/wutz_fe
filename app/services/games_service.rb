class GamesService

  def conn
    Faraday.new("https://pacific-wildwood-99462-95c6d81ab3e1.herokuapp.com")
  end

  def get_url(url)        
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_daily_game
    get_url("/api/challenges")
  end
end