class GameboardNotificationMailer < ApplicationMailer
  def new_gameboard_notification(user)
    @user = user
    mail(to: @user.email, subject: 'New Gameboard Available!')
  end
end