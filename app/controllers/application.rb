# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :api_authenticate
  before_filter :cas_authenticate
  before_filter :login_required
  layout lambda{ |c| c.request.xhr? ? nil : 'application' }

  class Unauthorized < StandardError; end
  rescue_from Unauthorized, :with => :notify_unauthorized

  make_resourceful do 
    response_for :create do |format|
      format.html { redirect_to object_path }
      format.json { render :json => current_object.to_json(:methods => :display_name) }
    end
  end

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '840cabc7ca831d186c322c120b732863'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  #
  include RadicalDesigns::LineinAccessible
  def current_user
    @user ||= !session[:cas_user].blank? && Agent.find_by_cas_user(session[:cas_user])
  end

  def api_authenticate
    return true unless api_request?
    authenticate_or_request_with_http_basic do |user_name, password|
      @user = Agent.find_by_cas_user( user_name ) if ( password == Linein::API_ACCESS_KEY ) and !password.blank?
    end
  end

  def login_required
    raise Unauthorized unless current_user
  end

  def notify_unauthorized
    render :text => "access not granted - no registered user #{session[:cas_user]}", :status =>:unauthorized
  end
end
