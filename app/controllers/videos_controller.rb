class VideosController < ApplicationController
  before_action :set_video, only: :show
  delegate :free?, to: :video

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  def paginate
    @videos = Video.page(params[:page] || 1)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @partial = authorized? ? 'player' : 'paywall'
  end

  private

  attr_reader :video

  def authorized?
    free? || signed_in?
    #|| entitled?
    # Entitlement check was disabled as it returns 403 rather than the expected resposes: 200 or 422
  end

  def entitled?
    signed_in? && video.entitled?(access_token)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_video
    @video = Video.find(params[:id])
  end
end
