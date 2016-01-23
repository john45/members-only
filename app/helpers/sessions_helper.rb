module SessionsHelper

  def sign_out
    @current_user = nil
    cookies.delete :remember_token
  end

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.encrypt_token(remember_token))
    self.current_user= user
  end

  def current_user
    @remember_token = User.encrypt_token(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: @remember_token)
  end

  def current_user=(user)
    @current_user = user
  end

  def before_add
    redirect_to signin_url unless signed_in?
  end

  def signed_in?
    !current_user.nil?
  end
end
