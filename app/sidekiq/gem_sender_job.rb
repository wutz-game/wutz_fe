class GemSenderJob
  include Sidekiq::Job

  def perform(*args)
    UserNotifierMailer.send_mood_email(email).deliver_now
  end
end
