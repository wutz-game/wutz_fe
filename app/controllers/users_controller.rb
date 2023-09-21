class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    new_user = User.create(user_params)
    session[:user_id] = new_user.id
    redirect_to root_path
  end

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
    flash[notice:] = "Logged out successfully."
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end