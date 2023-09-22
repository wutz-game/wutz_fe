feature 'Games Index Page', js: true do
  scenario 'shows initial popup on page load and how to play button / popup', :vcr do
    visit games_path
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

  scenario 'lets user click play button to start a game', :vcr do
    visit games_path

    within('#initialPopup') do
      find('#playBtn').click
    end

    expect(page).to have_content('Total Score: 0')
  end

  scenario 'lets user select a square and answer a question correctly', :vcr do
    visit games_path

    within('#initialPopup') do
      find('#playBtn').click
    end

    game_cell = find('.game-cell', match: :first)
    game_cell.click

    expect(page).to have_content('Do You Want To Know A _____ Agent Man')
    fill_in 'textInput', with: 'Secret'
    click_button 'Submit Response'

    expect(page).to have_content('Your response: Secret')
    expect(page).to have_content('Correct Response: Secret')

    expect(page).to have_css('#answerPopup', visible: true)
    within('#answerPopup') do
      find('#answerCloseBtn').click
    end

    # Check that the color of the square became green
    expect(game_cell[:style]).to include('background-color: green')

    # Check that the score is updated
    expect(page).to have_content('Total Score: 1')
  end

  scenario 'lets user select a square and answer a question incorrectly', :vcr do
    visit games_path

    within('#initialPopup') do
      find('#playBtn').click
    end

    game_cell = find('.game-cell', match: :first)
    game_cell.click

    fill_in 'textInput', with: 'Wrong Answer'
    click_button 'Submit Response'

    expect(page).to have_content('Your response: Wrong Answer')
    expect(page).to have_content('Correct Response: Secret')

    expect(page).to have_css('#answerPopup', visible: true)
    within('#answerPopup') do
      find('#answerCloseBtn').click
    end

    # Check that the color of the square became red
    expect(game_cell[:style]).to include('background-color: red')

    # Check that the score is updated
    expect(page).to have_content('Total Score: -1')
  end

  scenario 'lets user select a square and click skip question', :vcr do
    visit games_path

    within('#initialPopup') do
      find('#playBtn').click
    end
    game_cell = find('.game-cell', match: :first)
    game_cell.click

    click_button 'skipBtn'

    # Check that the color of the square became yellow
    expect(game_cell[:style]).to include('background-color: rgb(194, 186, 113')

    # Check that the score is not updated
    expect(page).to have_content('Total Score: 0')
  end
end
