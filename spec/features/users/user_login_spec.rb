require 'rails_helper'

RSpec.describe "Login" do
  it "can log in with valid credentials", :vcr do
    user = User.create(username: "username_test", email: "email_test", password: "password_test")

    visit root_path

    click_on "Login"

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Login"

    # visit current_url

    # expect(page).to have_content("Hello #{user.username}")
  end

  it "cannot log in with bad credentials", :vcr do
    user = User.create(username: "username_test", email: "email_test", password: "password_test")
  
    visit login_path
    
    fill_in :email, with: user.email
    fill_in :password, with: "incorrect password"
  
    click_on "Login"
  
    expect(current_path).to eq(login_path)
  end
end