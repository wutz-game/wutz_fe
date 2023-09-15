class GamesController < ApplicationController
  def index
    @categories = %w[Geography Science History]
    @points = [
      ['1 Point', '1 Point', '1 Point'],
      ['2 Points', '2 Points', '2 Points'],
      ['3 Points', '3 Points', '3 Points']
    ]
    @questions = [
      ['What is the capital of France?', 'What is the largest continent?', 'What is the longest river?'],
      ['What is the chemical symbol for water?', 'What planet is known as the Red Planet?',
       'What is the speed of light?'],
      ['Who was the first President of the United States?', 'What year did World War II end?', "Who wrote 'Hamlet'?"]
    ]
    @correct_answers = [
      ['Paris', 'Asia', 'Nile'],
      ['H2O', 'Mars', '299,792,458 m/s'],
      ['George Washington', '1945', 'William Shakespeare']
    ]
  end
end
