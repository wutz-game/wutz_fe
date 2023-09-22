require 'rails_helper'

RSpec.describe 'Games Index Page', js: true do
  before do
    @question = 'Golf short game practice area served up in the title of a Dr. Seuss book'
    @answer = 'a putting Green Eggs and Ham'

    # Stub the HTTP request to return your predefined data
    stub_request(:get, 'https://example.com/api/question')
      .to_return(body: { question: @question, answer: @answer }.to_json)
  end

  it 'shows initial popup on page load and how to play button / popup' do
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

  it 'lets user login' do
    # TO DO: Add test for login
  end

  it 'lets user click play button to start a game' do
    visit root_path

    within('#initialPopup') do
      find('#playBtn').click
    end

    expect(page).to have_content('Total Score: 0')
  end

  it 'lets user select a square and answer a question correctly' do
    visit root_path

    within('#initialPopup') do
      find('#playBtn').click
    end

    game_cell = find('.game-cell', match: :first)
    game_cell.click

    expect(page).to have_content(@question)
    fill_in 'textInput', with: @answer
    click_button 'Submit Response'

    expect(page).to have_content("Your response: #{@answer}")
    expect(page).to have_content("Correct Response: #{@answer}")

    expect(page).to have_css('#answerPopup', visible: true)
    within('#answerPopup') do
      find('#answerCloseBtn').click
    end
  end

  #   # Check that the color of the square became green
  expect(game_cell[:style]).to include('background-color: green')

  #   # Check that the score is updated
  expect(page).to have_content('Total Score: 1')
  # end

  it 'lets user select a square and answer a question incorrectly' do
    visit root_path

    within('#initialPopup') do
      find('#playBtn').click
    end

    game_cell = find('.game-cell', match: :first)
    game_cell.click

    expect(page).to have_content(@question)
    fill_in 'textInput', with: 'Wrong Answer'
    click_button 'Submit Response'

    expect(page).to have_content('Your response: Wrong Answer')
    expect(page).to have_content("Correct Response: #{@answer}")

    expect(page).to have_css('#answerPopup', visible: true)
    within('#answerPopup') do
      find('#answerCloseBtn').click
    end

    # Check that the color of the square became red
    expect(game_cell[:style]).to include('background-color: red')

    # Check that the score is updated
    expect(page).to have_content('Total Score: -1')
  end

  it 'lets user select a square and click skip question' do
    visit games_path

    within('#initialPopup') do
      find('#playBtn').click
    end
    game_cell = find('.game-cell', match: :first)
    game_cell.click

    expect(page).to have_content('Golf short game practice area served up in the title of a Dr. Seuss book')
    click_button 'skipBtn'

    # Check that the color of the square became yellow
    expect(game_cell[:style]).to include('background-color: rgb(194, 186, 113')

    # Check that the score is not updated
    expect(page).to have_content('Total Score: 0')
  end
end
