class UserMailer < ApplicationMailer
  def send_daily_email(user)
    @user = user
    mail(to: @user.email, subject: 'New Wutz Board is Available')
  end
end