require "rails_helper"

RSpec.describe "User create form" do
  it "creates new user" do
    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)

    click_on "Create Account"

    username = "username_test"
    email = "email_test"
    password = "password_test"

    fill_in :user_username, with: username
    fill_in :user_email, with: email
    fill_in :user_password, with: password

    click_on "Create User"

    # expect(current_path).to eq(root_path)

    # expect(page).to have_content("Hello #{user.username}!")
  end
end