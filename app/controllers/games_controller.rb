class GamesController < ApplicationController
  def index
    # Fetch category placeholders from the backend API
    @categories = fetch_categories_from_backend
  end

  def show
    game_url = params[:id]
    @game_data = fetch_game_data(game_url)
  end

  private

  def fetch_game_data(url); end

  def fetch_categories_from_backend
    ['Category 1 Placeholder', 'Category 2 Placeholder', 'Category 3 Placeholder']
  end
end
