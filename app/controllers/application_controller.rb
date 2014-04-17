class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery with: :exception
  before_filter :authenticate_user!

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

end
