require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  it 'sends a daily email' do
    user = User.create(username: "username_test1", email: "email1@test.com", password: "password_test1")
    
    email = UserMailer.send_daily_email(user).deliver_now

    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(email.to).to include(user.email)
  end
end