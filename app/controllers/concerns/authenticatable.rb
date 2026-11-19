module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
  end

  private

  def authenticate_user!
    token = request.headers["Authorization"]&.match(/\ABearer (.+)\z/)&.captures&.first

    unless token
      return render json: {
        error: "Authentication required"
      }, status: :unauthorized
    end

    digest = Digest::SHA256.hexdigest(token)

    @current_access_token = AccessToken.includes(:user).find_by(token_digest: digest)

    unless @current_access_token&.active?
      return render json: {
        error: "Invalid or expired token"
      }, status: :unauthorized
    end

    @current_user = @current_access_token.user
  end

  def current_user
    @current_user
  end
end