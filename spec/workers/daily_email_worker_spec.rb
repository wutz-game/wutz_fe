require 'rails_helper'

RSpec.describe DailyEmailWorker, type: :worker do
  let(:user) { create(:user) }

  before do
    DailyEmailWorker.perform_async
    DailyEmailWorker.drain
  end

  describe '#perform' do
    it 'enqueues the job' do
      expect {
        DailyEmailWorker.perform_async
      }.to change(DailyEmailWorker.jobs, :size).by(1)
    end

    it 'sends daily email notifications to all users' do
      last_email = ActionMailer::Base.deliveries.last
      expect(last_email.subject).to eq('New Gameboard Available!')
      expect(last_email.to).to eq([user.email]) # Adjust as needed
    end
  end
end