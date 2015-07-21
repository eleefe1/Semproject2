class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to session_login_path unless current_user
  end

  def authorize_admin
    redirect_to(session_login_path) unless current_user != nil && current_user.admin
  end

  def authorize_user
    redirect_to(session_login_path) unless current_user != nil && (current_user.id == @user.id || current_user.admin)
  end

  def authorize_checkout
    redirect_to(session_login_path) unless current_user != nil && (current_user == @checkout.user || current_user.admin)
  end

  def authorize_cart
    redirect_to(session_login_path) unless current_user != nil && (current_user == @cart.user || current_user.admin)
  end

  def validate_cart_has_items
    redirect_to(current_user.carts.last, notice: "You can\'t check out with no things in your cart, silly!") unless current_user.carts.last.cart_items.count != 0
  end
end
