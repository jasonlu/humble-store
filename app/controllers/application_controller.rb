class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :init


  def init
    @site_title = 'My Humble Store'

    # Initialize cart ID.
    session_id = request.session_options[:id]
    cookies[:cart_id] = { :value => session_id, :expires => 7.days.from_now } if cookies[:cart_id].blank?

  end
end
