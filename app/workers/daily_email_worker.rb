class DailyEmailWorker
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      GameboardNotificationMailer.new_gameboard_notification(user).deliver_now
    end
  end
end