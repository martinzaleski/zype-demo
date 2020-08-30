class Authenticator
  attr_reader :access_token

  def initialize(client_id = nil, client_secret = nil, site = nil)
    @client_id = client_id || Rails.application.credentials[:client_id]
    @client_secret = client_secret || Rails.application.credentials[:client_secret]
    @site = site || Rails.application.credentials[:site]
  end

  def authenticate!(username, password)
    @access_token = client.password.get_token(username, password)
  end

  def from_hash(hash)
    OAuth2::AccessToken.from_hash(client, hash)
  end

  private

  attr_reader :client_id, :client_secret, :site

  def client
    @client ||= OAuth2::Client.new(client_id, client_secret, site: site)
  end
end