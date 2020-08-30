class SessionsController < ApplicationController
  before_action :redirect, only: [:new, :create]

  def new;end

  def create
    begin
      authenticate!
      redirect_back fallback_location: videos_path
    rescue OAuth2::Error
      redirect_to :login, alert: 'Credentials are invalid'
    end
  end

  def destroy
    reset_session
    redirect_to :login
  end

  private

  def authenticate!
    authenticator.authenticate! params[:username], params[:password]
    store authenticator.access_token
    Rails.logger.info "New access token is #{session[:token]}"
  end

  def redirect
    return unless signed_in?
    redirect_to videos_path
  end
end
