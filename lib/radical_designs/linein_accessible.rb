module RadicalDesigns::LineinAccessible
  def current_user
    @user_name = session[:cas_user]
  end

  def api_request?
    request.request_uri =~ /^\/api/ 
  end

  def api_authenticate
    return true unless api_request?
    authenticate_or_request_with_http_basic do |user_name, password|
      @user_name = user_name if password == Linein::API_ACCESS_KEY
    end
  end

  def cas_authenticate
    return true if current_user
    CASClient::Frameworks::Rails::Filter.filter(self)
  end

end
