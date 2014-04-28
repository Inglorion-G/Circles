class SessionsController < ApplicationController
  before_action :require_user, only: :destroy

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["Incorrect username or password! Try, try again."]
      render :new
    else
      sign_in!(user)
      session[:token] = user.reset_token!
      redirect_to user_url(current_user)
    end
  end

  def destroy
    current_user.reset_token!
    session[:token] = nil
    redirect_to new_session_url
  end
end
