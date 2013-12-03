class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :init

  layout :subdomain_layout
  
  def subdomain_layout
    @domain = request.subdomains.first
    if @domain == 'admin'
      'admin'
    else
      'application'
    end
  end

  def init
    @site_title = 'My Humble Store'

    # Initialize cart ID.
    
    cookies[:cart_id] = { :value => session_id, :expires => 7.days.from_now } if cookies[:cart_id].blank?

  end

  def session_id
    session_id = request.session_options[:id]
  end

  def cart_id
    cookies[:cart_id]
  end

  def clear_cart
    cookies[:cart_id] = nil
  end
end
