class DailyEmailSenderWorker
  include Sidekiq::Worker

  def perform
    # puts 'Performing DailyEmailSenderWorker' # Debugging output
    User.all.each do |user|
      UserMailer.send_daily_email(user).deliver_now
    end
  end
end
