class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(
      email: params[:email]&.strip&.downcase
    )

    unless user&.authenticate(params[:password])
      return render json: {
        error: "Invalid email or password"
      }, status: :unauthorized
    end

    token_record, raw_token =  AccessToken.generate_for(user)

    render json: {
      token: raw_token,
      token_type: "Bearer",
      expires_at: token_record.expires_at,
      user: {
        id: user.id,
        name: user.name,
        email: user.email
      }
    }, status: :created
  end

  def destroy
    @current_access_token.revoke!

    render json: {
      message: "Logged out successfully"
    }
  end

end