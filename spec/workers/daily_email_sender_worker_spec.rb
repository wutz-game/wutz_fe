require 'rails_helper'

RSpec.describe DailyEmailSenderWorker, type: :worker do

  before do
    Sidekiq::Testing.inline!
  end

  it 'sends a daily email to all users' do
    user1 = User.create(username: "username_test1", email: "email1@test.com", password: "password_test1")
    user2 = User.create(username: "username_test2", email: "email2@test.com", password: "password_test2")

    worker = described_class.new

    worker.perform

    # debugging
    # puts "Email count: #{ActionMailer::Base.deliveries.count}"
    # puts "Last email recipient: #{ActionMailer::Base.deliveries.last.to}"
  
    expect(ActionMailer::Base.deliveries.count).to eq(2)
    expect(ActionMailer::Base.deliveries.last.to).to include(user2.email)

  end
end