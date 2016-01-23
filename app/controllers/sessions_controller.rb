class SessionsController < ApplicationController
  def new
    @session
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user.authenticate(params[:session][:password])
      sign_in(@user)
      render 'static/ok'
    else
      # Ne zaloginilis
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end

