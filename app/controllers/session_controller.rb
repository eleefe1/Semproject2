class SessionController < ApplicationController

  def create
    u = User.where(email: params[:email].downcase).first

    if u != nil && u.authenticate(params[:password])
      session[:user_id] = u.id
      redirect_to root_path, notice: 'Logged in Successfully'

    else
      redirect_to session_login_path, notice: 'Error logging in'
    end
  end

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged Out Successfully'
  end


end
