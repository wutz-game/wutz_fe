class GamesController < ApplicationController
  def index
    @categories = ['Category 1', 'Category 2', 'Category 3']
    @questions = [
      %w[Q1 Q2 Q3],
      %w[Q4 Q5 Q6],
      %w[Q7 Q8 Q9]
    ]
  end
end
