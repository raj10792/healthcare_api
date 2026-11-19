class AccessToken < ApplicationRecord
  belongs_to :user

  def self.generate_for(user)
    raw_token = SecureRandom.urlsafe_base64(48)

    token = user.access_tokens.create!(
      token_digest: Digest::SHA256.hexdigest(raw_token),
      expires_at: 24.hours.from_now
    )

    [token, raw_token]
  end

  def active?
    revoked_at.nil? && expires_at.future?
  end

  def revoke!
    update!(revoked_at: Time.current)
  end
end
