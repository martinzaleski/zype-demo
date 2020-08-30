module AuthenticationHelper
  def access_token
    session[:token].present? && authenticator.from_hash(session[:token])
  end

  def store(access_token)
    session[:token] = access_token.to_hash
  end

  def signed_in?
    begin
      access_token && !access_token.expired?
    rescue StandardError => e
      Rails.logger.warn e.message
      false
    end
  end

  def authenticator
    @authenticator ||= Authenticator.new
  end
end
