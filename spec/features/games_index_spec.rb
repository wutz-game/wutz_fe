require 'rails_helper'

feature 'Games Index Page', js: true, vcr: true do
  VCR.use_cassette('games/index') do
    scenario 'shows initial popup on page load and how to play button / popup' do
      visit root_path
      expect(page).to have_css('#initialPopup', visible: true)

      within('#initialPopup') do
        find('#howToPlayBtn').click
      end

      expect(page).to have_content('How to Play')

      within('#howToPlayPopup') do
        find('#returnBtn').click
      end

      expect(page).to have_content('Play')
      expect(page).to have_content('How to Play')
      expect(page).to have_content('Login')
    end
  end

  #   scenario 'lets user login' do
  #     # TO DO: Add test for login
  #   end

  scenario 'lets user click play button to start a game' do
    visit root_path

    within('#initialPopup') do
      find('#playBtn').click
    end

    expect(page).to have_content('Total Score: 0')
  end

  scenario 'lets user select a square and answer a question correctly' do
    visit games_path

    within('#initialPopup') do
      find('#playBtn').click
    end

    game_cell = find('.game-cell', match: :first)
    game_cell.click

    #     expect(page).to have_content('Golf short game practice area served up in the title of a Dr. Seuss book')
    #     fill_in 'textInput', with: 'a putting Green Eggs and Ham'
    #     click_button 'Submit Response'

    #     expect(page).to have_content('Your response: a putting Green Eggs and Ham')
    #     expect(page).to have_content('Correct Response: a putting Green Eggs and Ham')

    #     expect(page).to have_css('#answerPopup', visible: true)
    #     within('#answerPopup') do
    #       find('#answerCloseBtn').click
    #     end

    #     # Check that the color of the square became green
    #     expect(game_cell[:style]).to include('background-color: green')

    #     # Check that the score is updated
    #     expect(page).to have_content('Total Score: 1')
  end

  #   scenario 'lets user select a square and answer a question incorrectly' do
  #     visit games_path

  #     within('#initialPopup') do
  #       find('#playBtn').click
  #     end

  #     game_cell = find('.game-cell', match: :first)
  #     game_cell.click

  #     expect(page).to have_content('Golf short game practice area served up in the title of a Dr. Seuss book')
  #     fill_in 'textInput', with: 'Wrong Answer'
  #     click_button 'Submit Response'

  #     expect(page).to have_content('Your response: Wrong Answer')
  #     expect(page).to have_content('Correct Response: a putting Green Eggs and Ham')

  #     expect(page).to have_css('#answerPopup', visible: true)
  #     within('#answerPopup') do
  #       find('#answerCloseBtn').click
  #     end

  #     # Check that the color of the square became red
  #     expect(game_cell[:style]).to include('background-color: red')

  #     # Check that the score is updated
  #     expect(page).to have_content('Total Score: -1')
  #   end

  #   scenario 'lets user select a square and click skip question' do
  #     visit games_path

  #     within('#initialPopup') do
  #       find('#playBtn').click
  #     end
  #     game_cell = find('.game-cell', match: :first)
  #     game_cell.click

  #     expect(page).to have_content('Golf short game practice area served up in the title of a Dr. Seuss book')
  #     click_button 'skipBtn'

  #     # Check that the color of the square became yellow
  #     expect(game_cell[:style]).to include('background-color: rgb(194, 186, 113')

  #     # Check that the score is not updated
  #     expect(page).to have_content('Total Score: 0')
  #   end
end
