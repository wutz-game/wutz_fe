class MailersController < ApplicationController
  def create
    GemSenderJob.perform_async(params[:mailers][:email]
    flash[:message] = "You did it! Email sent to #{params[:mailers][:email]}"
    redirect_to "/sent"
  end

  def sent
  end
end