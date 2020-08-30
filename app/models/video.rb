class Video
  include Her::Model
  include Paginator

  alias_attribute :id, :_id

  def free?
    !subscription_required
  end

  def entitled?(access_token)
    response = Faraday.get(Rails.application.config_for(:app)[:api_url], access_token: access_token)
    response.success?
  end

  def thumbnail_url(height = nil)
    thumbnail(height)['url']
  end

  def thumbnail(height = nil)
    thumbnails.detect do |thumb|
      thumb['height'] == (height || DEFAULT_THUMBNAIL_HEIGHT)
    end || thumbnails.first
  end

  private

  DEFAULT_THUMBNAIL_HEIGHT = 480
end
