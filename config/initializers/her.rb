class ZypeApiAuthentication < Faraday::Middleware
  def call(env)
    env.url.query = env.url.query.blank? ? '' : "#{env.url.query}&"
    env.url.query << "app_key=#{Rails.application.credentials[:app_key]}"
    @app.call(env)
  end
end

class ZypeApiParser < Faraday::Response::Middleware
  def on_complete(env)
    json = MultiJson.load(env[:body], symbolize_keys: true)
    env[:body] = {
        data: json[:response],
        metadata: json[:pagination]
    }
  end
end

Her::API.setup url: Rails.application.config_for(:app)[:api_url] do |c|
  # Request
  c.use ZypeApiAuthentication
  c.use Faraday::Request::UrlEncoded

  # Response
  c.use ZypeApiParser
  c.use Faraday::Response::RaiseError

  # Adapter
  c.use Faraday::Adapter::NetHttp
end