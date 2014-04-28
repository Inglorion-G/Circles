module SessionsHelper

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_token(session[:token])
  end

  def current_user?
    !!current_user
  end

  def sign_in!(user)
    session[:token] = user.reset_token!
  end

  def signed_in?(user)
    user.token == session[:token]
  end

  def require_user
    redirect_to new_session_url unless !!current_user
  end

end
