require 'rails_helper'

RSpec.describe "Login" do
  it "can log in with valid credentials" do
    user = User.create(username: "username_test", password: "password_test")

    visit root_path

    click_on "Login"

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Login"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Welcome, #{user.username}")
  end

  it "cannot log in with bad credentials" do
    user = User.create(username: "username_test", password: "password_test")
  
    visit login_path
    
    fill_in :username, with: user.username
    fill_in :password, with: "incorrect password"
  
    click_on "Login"
  
    expect(page).to have_content("Sorry, your credentials are bad.")
  end
end