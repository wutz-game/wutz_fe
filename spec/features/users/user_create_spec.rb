require "rails_helper"

RSpec.describe "User create form", :vcr do
  it "creates new user" do
    visit root_path

    click_link "Login"

    expect(current_path).to eq("/")

    click_on "Create Account"
    
    expect(current_path).to eq('/login')

    username = "username_test"
    email = "email_test"
    password = "password_test"

    fill_in :user_username, with: username
    fill_in :user_email, with: email
    fill_in :user_password, with: password

    click_on "Create User"

    # expect(page).to have_content("Hello #{user.username}!")
  end
end