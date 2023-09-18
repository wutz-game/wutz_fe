feature 'Games Index Page', js: true do
  scenario 'lets user select a square and answer a question correctly' do
    visit games_path
    game_cell = find('.game-cell', match: :first)
    game_cell.click

    expect(page).to have_content('Golf short game practice area served up in the title of a Dr. Seuss book', wait: 10)
    fill_in 'textInput', with: 'a putting Green Eggs and Ham'
    click_button 'Submit'
    expect(page).to have_content('Your response: a putting Green Eggs and Ham')
    expect(page).to have_content('Correct Response: a putting Green Eggs and Ham')

    expect(page).to have_css('#answerPopup', visible: true, wait: 10)
    within('#answerPopup') do
      find('#answerCloseBtn').click
    end

    # Check that the color of the square became green
    expect(game_cell[:style]).to include('background-color: green')

    # Check that the score is updated
    expect(page).to have_content('Total Score: 1')
  end

  scenario 'lets user select a square and answer a question incorrectly' do
    visit games_path
    game_cell = find('.game-cell', match: :first)
    game_cell.click

    expect(page).to have_content('Golf short game practice area served up in the title of a Dr. Seuss book', wait: 10)
    fill_in 'textInput', with: 'Wrong Answer'
    click_button 'Submit'
    expect(page).to have_content('Your response: Wrong Answer')
    expect(page).to have_content('Correct Response: a putting Green Eggs and Ham')

    expect(page).to have_css('#answerPopup', visible: true, wait: 10)
    within('#answerPopup') do
      find('#answerCloseBtn').click
    end

    # Check that the color of the square became red
    expect(game_cell[:style]).to include('background-color: red')

    # Check that the score is updated
    expect(page).to have_content('Total Score: -1')
  end

  scenario 'lets user select a square and click skip question' do
    visit games_path
    game_cell = find('.game-cell', match: :first)
    game_cell.click

    expect(page).to have_content('Golf short game practice area served up in the title of a Dr. Seuss book', wait: 10)
    click_button 'skipBtn'

    # Check that the color of the square became yellow
    expect(game_cell[:style]).to include('background-color: rgb(194, 186, 113')

    # Check that the score is not updated
    expect(page).to have_content('Total Score: 0')
  end
end
